import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mental_health/components/cards/calendar_card.dart';
import 'package:mental_health/components/cards/colored_card.dart';
import 'package:mental_health/components/interaction_components/little_button.dart';
import 'package:mental_health/models/primaryData.dart';
import 'package:mental_health/services/allert.dart';
import 'package:mental_health/services/calendar_services.dart';
import 'package:mental_health/views/calendar_day_view.dart';
import '../const.dart';
import 'package:mental_health/main.dart';
import "package:mental_health/components/interaction_components/bottom_sheet.dart";
import 'avatar.dart';

class UserDashboard extends StatefulWidget {
  UserDashboard({this.index});
  final int index;

  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int month = 0;
  int days;
  int year;
  @override
  void initState() {
    month = DateTime.now().month - 1;
    year = DateTime.now().year;
    days = dayInMonth(month);

    super.initState();
  }

  int dayInMonth(int month) {
    switch (month) {
      case 1:
        return 28;
      case 0:
      case 2:
      case 4:
      case 6:
      case 7:
      case 9:
      case 11:
        return 31;
      case 3:
      case 5:
      case 8:
      case 10:
        return 30;
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Kalendarz",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            if (month != 0) {
                              month--;
                              days = dayInMonth(month + 1);
                            } else {
                              year--;
                              month = 11;
                              days = dayInMonth(month + 1);
                            }
                          },
                        );
                        CalendarServices.getNotesForMonth(
                            store.state.families[widget.index].familyId,
                            month,
                            context);
                      },
                      child: Icon(Icons.arrow_back_ios),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            if (month != 11) {
                              days = dayInMonth(month + 1);
                              month++;
                            } else {
                              year++;
                              month = 0;
                              days = dayInMonth(month + 1);
                            }
                            CalendarServices.getNotesForMonth(
                                store.state.families[widget.index].familyId,
                                month,
                                context);
                          },
                        );
                      },
                      child: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 240,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: days,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CalendarCard(
                    month: months[month],
                    day: index + 1,
                    year: year,
                    psyNote: true,
                    visit: true,
                    onTap: () {
                      if (store.state.families.length != 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DayView(
                              day: index + 1,
                              month: month,
                              year: year,
                              index: 0,
                            ),
                          ),
                        );
                      } else {
                        allert(
                            "Musisz być połączony ze specjalistą by móc dodawać wpisy!!!",
                            context);
                      }
                    },
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 8,
          ),
          ColoredCard(
            onTap: () {
              if (store.state.families.length != 1) {
                ShowBottomSheet.bottomSheetAddFamily(context);
              }
            },
            child: StoreConnector<PrimaryData, PrimaryData>(
              converter: (store) => store.state,
              builder: (context, state) {
                if (store.state.userInfo.role == USER_ROLE) {
                  if (store.state.families.length != 0) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Avatar(
                              size: 60,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Twój psycholog:",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  store.state.families[widget.index]
                                      .psychologistNames,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nie jesteś jeszcze połączony ze specjalistą!!!",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                LittleButton(
                                  label: "Dodaj",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

// StoreConnector<PrimaryData, PrimaryData>(
//                 converter: (store) => store.state,
//                 builder: (context, state) {
//                   return Text(state.token.toString());
//                 },
//               )ww
