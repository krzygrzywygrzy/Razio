import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mental_health/components/cards/calendar_card.dart';
import 'package:mental_health/components/cards/colored_card.dart';
import 'package:mental_health/components/interaction_components/little_button.dart';
import 'package:mental_health/models/primaryData.dart';
import 'package:mental_health/services/allert.dart';
import 'package:mental_health/views/calendar_day_view.dart';
import '../const.dart';
import 'package:mental_health/main.dart';

class UserDashboard extends StatefulWidget {
  UserDashboard({Key key}) : super(key: key);

  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int month = 0;
  int days;
  @override
  void initState() {
    month = DateTime.now().month - 1;
    days = dayInMonth(month);
    super.initState();
  }

  int dayInMonth(int month) {
    switch (month) {
      case 1:
        return 28;
        break;
      case 0:
      case 2:
      case 4:
      case 6:
      case 7:
      case 9:
      case 11:
        return 31;
        break;
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
                    onTap: () {
                      if (store.state.families.length != 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DayView(
                              day: index + 1,
                              month: month,
                              year:
                                  DateTime.now().year, //TODO: chceck with year
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
            child: StoreConnector<PrimaryData, PrimaryData>(
              converter: (store) => store.state,
              builder: (context, state) {
                if (store.state.families.length != 0) {
                  return Column();
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
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
                            children: [
                              Container(
                                child: TextField(),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
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
