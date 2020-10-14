import 'package:flutter/material.dart';
import 'package:mental_health/models/painter.dart';

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
        child: CustomPaint(
          painter: MyPainter(),
          child: Container(
            height: 500,
          ),
        ),
      ),
    );
  }
}
