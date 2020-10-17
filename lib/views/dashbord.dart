import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mental_health/components/calendar_card.dart';
import 'package:mental_health/components/colored_card.dart';
import 'package:mental_health/components/icon_card.dart';
import 'package:mental_health/models/primaryData.dart';

class Dashbord extends StatefulWidget {
  @override
  _DashbordState createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.white,
            Color(0xffe3e3e3),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Witaj!",
                      style: TextStyle(
                        fontSize: 35,
                        letterSpacing: 1,
                      ),
                    ),
                    Container(
                      height: 50,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://samequizy.pl/wp-content/uploads/2016/03/filing_images_27b2790a29f1.jpg"),
                      ),
                    ),
                  ],
                ),
              ),
              ColoredCard(
                onTap: () {
                  Navigator.pushNamed(context, "/privateNotes");
                },
              ),
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
              Container(
                height: 240,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CalendarCard(),
                    CalendarCard(),
                    CalendarCard(),
                  ],
                ),
              ),
              SizedBox(
                height: 14,
              ),
              IconCard(),
            ],
          ),
        ),
      ),
    );
  }
}

// StoreConnector<PrimaryData, PrimaryData>(
//                 converter: (store) => store.state,
//                 builder: (context, state) {
//                   return Text(state.token.toString());
//                 },
//               )
