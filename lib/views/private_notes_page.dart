import 'package:flutter/material.dart';
import 'package:mental_health/components/interaction_components/ovalButton.dart';
import 'package:mental_health/const.dart';

class PrivateNotesPage extends StatefulWidget {
  PrivateNotesPage({Key key}) : super(key: key);

  @override
  _PrivateNotesPageState createState() => _PrivateNotesPageState();
}

class _PrivateNotesPageState extends State<PrivateNotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [],
        ),
      ),
      /////// floating action button
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffc9c9c9),
                        blurRadius: 5,
                        spreadRadius: 0.2,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            OvalButton(
              color: kFamButtonsColors[0],
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
