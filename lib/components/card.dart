import 'package:flutter/material.dart';

class Card extends StatelessWidget {
  Card({this.child, this.onTap});
  final Widget child;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: child,
        height: 230,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xffc9c9c9),
              blurRadius: 5,
              spreadRadius: 0.2,
            ),
          ],
        ),
      ),
    );
  }
}
