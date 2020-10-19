import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mental_health/components/calendar_card.dart';
import 'package:mental_health/components/colored_card.dart';
import 'package:mental_health/components/families_list.dart';
import 'package:mental_health/main.dart';
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
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Twoje notatki",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20,
                                  letterSpacing: 1),
                            ),
                            Text(
                              "Tutaj masz podgląd to twoich osobistych notatek",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Color(0xffe6e6e6)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 4),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 4),
                                  child: Text("Sprawdź"),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Icon(
                        Icons.event_note_rounded,
                        color: Colors.white,
                        size: 90,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/privateNotes");
                },
              ),
              //FamiliesList(),
              StoreConnector<PrimaryData, PrimaryData>(
                converter: (store) => store.state,
                builder: (context, state) {
                  if (store.state.userInfo.role == "PSY") {
                    return FamiliesList();
                  } else
                    return Container();
                },
              )
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
//               )ww