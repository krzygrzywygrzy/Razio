import 'package:flutter/material.dart';

class OvalButton extends StatelessWidget {
  final Icon icon;
  final List<Color> color;
  final Function onTap;

  OvalButton({this.color, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: color,
            ),
            boxShadow: [
              BoxShadow(
                color: color[0],
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
