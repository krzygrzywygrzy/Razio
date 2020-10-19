import 'package:flutter/material.dart';

class ColoredCard extends StatelessWidget {
  final Function onTap;
  final Widget child;
  ColoredCard({this.onTap, this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0xffD93657),
                  spreadRadius: 0.2,
                  blurRadius: 5,
                ),
              ],
              gradient: LinearGradient(
                colors: [
                  //  Color(0xff4254D1),
                  //  Color(0xff35409B),
                  Color(0xffD93657),
                  Color(0xffC61F40),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(25)),
          child: child,
        ),
      ),
    );
  }
}
