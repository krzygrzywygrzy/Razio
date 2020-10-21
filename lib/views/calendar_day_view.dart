import 'package:flutter/material.dart';
import 'package:mental_health/components/cards/colored_card.dart';
import 'package:mental_health/const.dart';
import 'package:mental_health/main.dart';
import 'package:mental_health/models/calendarNote.dart';
import 'package:mental_health/models/date.dart';

class DayView extends StatefulWidget {
  DayView({this.day, this.month, this.year});
  final int day, month, year;

  @override
  _DayViewState createState() => _DayViewState();
}

class _DayViewState extends State<DayView> {
  CalendarNote note;
  String message = "";
  @override
  void initState() {
    note = CalendarNote(
        message: "",
        // userId: store.state.families[0].usrId,
        userRole: "USR",
        date: Date(
          year: widget.year.toString(),
          month: widget.month.toString(),
          day: widget.day.toString(),
          hour: DateTime.now().hour.toString(),
          minute: DateTime.now().minute.toString(),
        ));
    getData();
    super.initState();
  }

  getData() {
    if (store.state.families[0].calendarNotes.length != 0) {
      for (int i = 1;
          i <= store.state.families[0].calendarNotes.length - 1;
          i++) {
        if (store.state.families[0].calendarNotes[i].date.day ==
                widget.day.toString() ||
            store.state.families[0].calendarNotes[i].date.month ==
                widget.month.toString() ||
            store.state.families[0].calendarNotes[i].date.day ==
                widget.year.toString()) {
          note = store.state.families[0].calendarNotes[i];
          break;
        }
      }
    }
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
                          child: TextField(
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
