import 'package:flutter/material.dart';
import 'package:mental_health/components/cards/colored_card.dart';
import 'package:mental_health/const.dart';
import 'package:mental_health/main.dart';
import 'package:mental_health/models/calendarNote.dart';
import 'package:mental_health/models/date.dart';
import 'package:mental_health/redux/actions.dart';
import 'package:mental_health/services/calendar_services.dart';

class DayView extends StatefulWidget {
  DayView({this.day, this.month, this.year, this.index});
  final int day, month, year, index;

  @override
  _DayViewState createState() => _DayViewState();
}

class _DayViewState extends State<DayView> {
  String message = "";
  String psyMessage = "";
  @override
  void initState() {
    getData();
    super.initState();
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

  bool canAddNote() {
    if (widget.day == DateTime.now().day &&
        widget.month + 1 == DateTime.now().month &&
        widget.year == DateTime.now().year)
      return true;
    else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Align(
                  child: Column(
                    children: [],
                  ),
                ),
              ),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffc9c9c9),
                          blurRadius: 5,
                          spreadRadius: 0.2,
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 16.0, left: 16, right: 16, bottom: 30),
                          child: TextFormField(
                            enabled: canAddNote(),
                            initialValue: message,
                            cursorColor: Theme.of(context).primaryColor,
                            maxLines: null,
                            onChanged: (value) {
                              message = value;
                            },
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              hintText: "Twoja notatka",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 24,
                          right: 24,
                          child: GestureDetector(
                            onTap: () async {
                              if (canAddNote()) {
                                try {
                                  CalendarServices.addNote(
                                      store.state.families[widget.index]
                                          .familyId,
                                      message,
                                      context);
                                  setState(() {
                                    store.dispatch(
                                      AddNoteInCallendar(
                                        payload: CalendarNote(
                                          userId: store.state.userInfo.id,
                                          message: message,
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
                                } catch (e) {}
                              }
                            },
                            child: Text("Zapisz"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ColoredCard(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.pending_actions_rounded,
                            color: Colors.white,
                          ),
                          Text(
                            " - Nie ma zaplanowanej wizyty na ten dzień",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
