import 'package:flutter/material.dart';
import 'package:mental_health/components/cards/calendar_card.dart';
import '../const.dart';

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
    days = 31;
    super.initState();
  }

  daysNumber() {}

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
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
