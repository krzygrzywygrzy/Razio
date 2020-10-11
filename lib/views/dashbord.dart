import 'package:flutter/material.dart';

class Dashbord extends StatefulWidget {
  @override
  _DashbordState createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "Welcome back nibba",
              style: TextStyle(
                fontSize: 60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
