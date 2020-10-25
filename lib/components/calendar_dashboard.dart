import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mental_health/components/cards/calendar_card.dart';
import 'package:mental_health/components/cards/colored_card.dart';
import 'package:mental_health/components/interaction_components/little_button.dart';
import 'package:mental_health/models/primaryData.dart';
import 'package:mental_health/services/calendar_services.dart';
import 'package:mental_health/services/visits_services.dart';
import 'package:mental_health/views/calendar_day_view.dart';
import 'package:screen_loader/screen_loader.dart';
import '../const.dart';
import 'package:mental_health/main.dart';
import "package:mental_health/components/interaction_components/bottom_sheet.dart";
import 'avatar.dart';
import 'package:indexed_list_view/indexed_list_view.dart';

class CalendarDashboard extends StatefulWidget {
  CalendarDashboard({this.index});
  final int index;

  @override
  _CalendarDashboardState createState() => _CalendarDashboardState();
}

class _CalendarDashboardState extends State<CalendarDashboard>
    with ScreenLoader<CalendarDashboard> {
  IndexedScrollController controller = IndexedScrollController();

  int month = 0;
  int days;
  int year;
  @override
  void initState() {
    month = DateTime.now().month - 1;
    year = DateTime.now().year;
    days = dayInMonth(month);
    controller.jumpToIndex(DateTime.now().day - 1);
    super.initState();
  }

  @override
  Widget loader() {
    return Center(
      child: SizedBox(
        height: 60,
        width: 60,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(
            Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }

  //TODO: chceck if there is DataTime funtion for this
  int dayInMonth(int month) {
    switch (month) {
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
      case 1:
        return 28;
      default:
        break;
    }
  }

  // get visits list and notes list when month in calendar is changed
  Future getDataForMonth() async {
    try {
      await CalendarServices.getNotesForMonth(
        store.state.families[widget.index].familyId,
        month + 1,
        widget.index,
        context,
      );
      await VisitsServices.getVisitsForMonth(
        month + 1,
        store.state.families[widget.index].familyId,
        widget.index,
        context,
      );
    } catch (e) {
      print(e);
    }
  }

  //show appointment icon in calendar card
  // ignore: missing_return
  bool isVisit(int year, int month, int day) {
    if (store.state.families[widget.index].visits != null &&
        widget.index != null) {
      for (int i = 0;
          i <= store.state.families[widget.index].visits.length - 1;
          i++) {
        if (store.state.families[widget.index].visits[i].date.day == day + 1 &&
            store.state.families[widget.index].visits[i].date.month ==
                month + 1 &&
            store.state.families[widget.index].visits[i].date.year == year) {
          return true;
        } else {
          return false;
        }
      }
    } else
      return false;
  }

  //show the PSY note icon
  //do not add 1 to month and day
  // ignore: missing_return
  bool isNote(int year, int month, int day) {
    if (store.state.families[widget.index].calendarNotes != null &&
        widget.index != null) {
      for (int i = 0;
          i <= store.state.families[widget.index].calendarNotes.length - 1;
          i++) {
        if (store.state.families[widget.index].calendarNotes[i].date.day ==
                day + 1 &&
            store.state.families[widget.index].calendarNotes[i].date.month ==
                month + 1 &&
            store.state.families[widget.index].calendarNotes[i].date.year ==
                year) {
          return true;
        } else {
          return false;
        }
      }
    }
    return false;
  }

  //show panel with psyhologist info
  Widget showPsyPanel() {
    if (store.state.userInfo.role == USER_ROLE) {
      return ColoredCard(
        onTap: () {
          if (store.state.families.length != 1) {
            ShowBottomSheet.bottomSheetAddFamily(context);
          }
        },
        child: StoreConnector<PrimaryData, PrimaryData>(
          converter: (store) => store.state,
          builder: (context, state) {
            if (store.state.families.length != 0) {
              return Padding(
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
                          store.state.families[widget.index].psychologistNames,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //TODO: add loading inditactor when adding

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
          },
        ),
      );
    } else {
      return Container();
    }
  }

  //TODO: show callendar even when user is not connected to psyhologist
  Widget showCallendar() {
    if (store.state.families.length != 0) {
      return IndexedListView.builder(
        scrollDirection: Axis.horizontal,
        addRepaintBoundaries: false,
        maxItemCount: days - 1,
        minItemCount: 0,
        controller: controller,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CalendarCard(
              month: months[month],
              day: index + 1,
              year: year,
              psyNote: isNote(year, month, index),
              visit: isVisit(year, month, index),
              onTap: () {
                if (store.state.families.length != 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DayView(
                        day: index + 1,
                        month: month,
                        year: year,
                        index: widget.index,
                      ),
                    ),
                  );
                }
              },
            ),
          );
        },
      );
    } else {
      return Center(
        child:
            Text("Aby uzyskać dostęp do kalendarza... \npodaj kod psychologa"),
      );
    }
  }

  @override
  Widget screen(BuildContext context) {
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
                      onTap: () async {
                        setState(
                          () async {
                            if (month != 0) {
                              month--;
                            } else {
                              year--;
                              month = 11;
                            }
                            await this.performFuture(getDataForMonth);
                            days = dayInMonth(month);
                          },
                        );
                      },
                      child: Icon(Icons.arrow_back_ios),
                    ),
                    GestureDetector(
                      onTap: () async {
                        setState(
                          () async {
                            if (month != 11) {
                              month++;
                            } else {
                              year++;
                              month = 0;
                            }
                            await performFuture(getDataForMonth);
                            days = dayInMonth(month);
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
            child: showCallendar(),
          ),
          SizedBox(
            height: 8,
          ),
          showPsyPanel(),
        ],
      ),
    );
  }
}
