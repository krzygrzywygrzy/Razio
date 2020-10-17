import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final Function toDo;
  Button({@required this.label, this.toDo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toDo,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(45)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                // Color(0xffff9ea4),
                //  Color(0xfff44f78),
                Color(0xffD93657),
                Color(0xffC61F40),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 0.2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ]),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
