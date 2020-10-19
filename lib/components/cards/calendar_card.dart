import 'package:flutter/material.dart';

class CalendarCard extends StatelessWidget {
  const CalendarCard({this.onTap});
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            width: 230,
            height: 230,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "17",
                  style: TextStyle(
                    fontSize: 90,
                    fontWeight: FontWeight.w300,
                    color: Color(0xffD93657),
                  ),
                ),
                Text(
                  "Października",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text("Sobota"),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.pending_actions_outlined),
                    Icon(Icons.border_color)
                  ],
                ),
              ],
            ),
          ),
        ),
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
