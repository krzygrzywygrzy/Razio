import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  const IconCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: GestureDetector(
        child: Container(
          height: 80,
          width: 80,
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 35,
          ),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Color(0xffD93657),
                spreadRadius: 0.2,
                blurRadius: 5,
              ),
            ],
            gradient: LinearGradient(
              colors: [
                Color(0xffD93657),
                Color(0xffC61F40),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
    );
  }
}
