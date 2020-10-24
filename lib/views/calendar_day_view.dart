import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mental_health/components/interaction_components/text_area.dart';
import 'package:mental_health/const.dart';
import 'package:mental_health/main.dart';
import 'package:mental_health/models/calendarNote.dart';
import 'package:mental_health/models/date.dart';
import 'package:mental_health/redux/actions.dart';
import 'package:mental_health/services/calendar_services.dart';
import 'package:mental_health/main.dart';

class DayView extends StatefulWidget {
  DayView({this.day, this.month, this.year, this.index});
  final int day, month, year, index;

  @override
  _DayViewState createState() => _DayViewState();
}

class _DayViewState extends State<DayView> {
  //TODO: show psy message
  String message = "";
  String psyMessage = "";
  @override
  void initState() {
    getData();
    super.initState();
  }

  //show information about appointment
  // ignore: missing_return
  String visitDate() {
    if (store.state.families[widget.index].visits != null) {
      for (int i = 0;
          i <= store.state.families[widget.index].visits.length - 1;
          i++) {
        if (store.state.families[widget.index].visits[i].date.day ==
                widget.day &&
            store.state.families[widget.index].visits[i].date.month ==
                widget.month + 1 &&
            store.state.families[widget.index].visits[i].date.year ==
                widget.year) {
          return "- Wizyta o godzinie ${store.state.families[widget.index].visits[i].date.hour}:${store.state.families[widget.index].visits[i].date.minute} !";
        } else {
          return " - Brak zaplanowanej wizyty na dziś";
        }
      }
    }
  }

  getData() {
    if (store.state.families[widget.index].calendarNotes != null) {
      store.state.families[widget.index].calendarNotes.forEach((element) {
        if (widget.year == element.date.year &&
            widget.month + 1 == element.date.month &&
            widget.day == element.date.day) {
          if (element.userRole == USER_ROLE) {
            message = element.message;
          } else if (element.userRole == PSY_ROLE) {
            psyMessage = element.message;
          }
        }
      });
    }
  }

  bool canAddNote(String role) {
    if (store.state.userInfo.role == role) {
      if (widget.day == DateTime.now().day &&
          widget.month + 1 == DateTime.now().month &&
          widget.year == DateTime.now().year)
        return true;
      else
        return false;
    } else
      return false;
  }

  addNote() {
    print("Dodawanie notatki");
    if (canAddNote(store.state.userInfo.role)) {
      try {
        CalendarServices.addNote(
          store.state.families[widget.index].familyId,
          store.state.userInfo.role == USER_ROLE ? message : psyMessage,
          context,
          widget.index,
        );
        setState(() {
          store.dispatch(
            AddNoteInCallendar(
              index: widget.index,
              payload: CalendarNote(
                userId: store.state.userInfo.id,
                message: store.state.userInfo.role == USER_ROLE
                    ? message
                    : psyMessage,
                userRole: store.state.userInfo.role,
                date: Date(
                  day: widget.day,
                  month: widget.month + 1,
                  year: widget.year,
                  minute: DateTime.now().minute,
                  hour: DateTime.now().hour,
                ),
              ),
            ),
          );
        });
        Navigator.pop(context);
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SafeArea(
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 24,
                              right: 24,
                              top: 16,
                            ),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "${widget.day}",
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 0),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "${months[widget.month]}",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.pending_actions_rounded,
                          color: Theme.of(context).primaryColor,
                        ),
                        Text(
                          visitDate(),
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                  ),
                  TextArea(
                    message: message,
                    flex: 0.56,
                    hint: "twoja notatka",
                    enabled: canAddNote(USER_ROLE),
                    onChanged: (value) {
                      message = value;
                    },
                    saveButtonAction: () {
                      addNote();
                    },
                  ),
                  TextArea(
                    message: psyMessage,
                    flex: 0.4,
                    hint: "twój doktor jeszcze nic nie napisał",
                    enabled: canAddNote(PSY_ROLE),
                    onChanged: (value) {
                      psyMessage = value;
                    },
                    saveButtonAction: () {
                      addNote();
                    },
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(bottom: 16),
                  //   child: ColoredCard(
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             Icon(
                  //               Icons.pending_actions_rounded,
                  //               color: Colors.white,
                  //             ),
                  //             Text(
                  //               " - Nie ma zaplanowanej wizyty na ten dzień",
                  //               style: TextStyle(color: Colors.white),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Color(0xffe3e3e3),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
