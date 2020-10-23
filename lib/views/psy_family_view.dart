import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mental_health/components/avatar.dart';
import 'package:mental_health/components/cards/colored_card.dart';
import 'package:mental_health/components/interaction_components/little_button.dart';
import 'package:mental_health/components/calendar_dashboard.dart';
import 'package:mental_health/const.dart';
import 'package:mental_health/models/date.dart';
import 'package:mental_health/models/primaryData.dart';
import 'package:flutter/cupertino.dart';
import 'package:mental_health/models/visits.dart';
import 'package:mental_health/redux/actions.dart';
import 'package:mental_health/services/visits_services.dart';
import 'package:mental_health/main.dart';

class PsyFamilyView extends StatefulWidget {
  PsyFamilyView({this.index});
  final int index;
  @override
  _PsyFamilyViewState createState() => _PsyFamilyViewState();
}

class _PsyFamilyViewState extends State<PsyFamilyView> {
  DateTime appointmentDate = DateTime.now();
  TimeOfDay appointmentTime = TimeOfDay.now();

  addAppointment() {
    Date appDate = Date(
      year: appointmentDate.year,
      month: appointmentDate.month,
      day: appointmentDate.day,
      minute: appointmentTime.minute,
      hour: appointmentTime.hour,
    );
    //TODO: add message input
    VisitsServices.add(
      context,
      store.state.families[widget.index].familyId,
      "Nowa wizyta",
      appDate,
    );
    setState(() {
      store.dispatch(
        AddVisit(
          index: widget.index,
          payload: Visit(
              date: appDate,
              message: "Nowa wizyta",
              familyId: store.state.families[widget.index].familyId),
        ),
      );
    });
  }

  pickDate() async {
    DateTime newDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2025),
        builder: (context, child) {
          return Theme(
            child: child,
            data: ThemeData(
              colorScheme: ColorScheme.light()
                  .copyWith(primary: Theme.of(context).primaryColor),
            ),
          );
        });
    setState(() {
      if (newDate != null) appointmentDate = newDate;
    });
  }

  pickTime() async {
    TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: appointmentTime,
      builder: (context, child) {
        return Theme(
          child: child,
          data: ThemeData(
            colorScheme: ColorScheme.light()
                .copyWith(primary: Theme.of(context).primaryColor),
          ),
        );
      },
    );
    setState(() {
      if (newTime != null) appointmentTime = newTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: kGradientBg,
        child: SafeArea(
          child: ListView(
            children: [
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 24,
                        bottom: 8,
                      ),
                      child: Flexible(
                        child: Avatar(
                          size: 100,
                        ),
                      ),
                    ),
                    StoreConnector<PrimaryData, PrimaryData>(
                        builder: (context, state) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 8,
                            ),
                            child: Text(
                              state.families[widget.index].userNames,
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          );
                        },
                        converter: (store) => store.state),
                    CalendarDashboard(
                      index: widget.index,
                    ),
                    ColoredCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Ustal wizytę",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                LittleButton(
                                  onTap: () {
                                    pickDate();
                                  },
                                  label:
                                      "Data: ${appointmentDate.day}/${appointmentDate.month}/${appointmentDate.year}",
                                ),
                                LittleButton(
                                  label:
                                      "Godzina: ${appointmentTime.hour}:${appointmentTime.minute}",
                                  onTap: () {
                                    pickTime();
                                  },
                                ),
                                LittleButton(
                                  onTap: () {
                                    addAppointment();
                                  },
                                  label: "Dodaj",
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
