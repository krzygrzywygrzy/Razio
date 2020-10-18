import 'package:flutter/material.dart';

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
          ],
        ),
      ),
      /////// floating action button
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffD93657),
                Color(0xffC61F40),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xffD93657),
                spreadRadius: 0.2,
                blurRadius: 5,
              ),
            ],
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
