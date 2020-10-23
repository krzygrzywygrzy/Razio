import 'package:flutter/material.dart';

class CalendarCard extends StatelessWidget {
  const CalendarCard(
      {this.onTap, this.month, this.day, this.year, this.visit, this.psyNote});
  final Function onTap;
  final String month;
  final int year;
  final int day;
  final bool visit, psyNote;

  List<Widget> bottomIcons() {
    List<Widget> list = [];
    if (visit != null && psyNote != null) {
      visit == true
          ? list.add(
              Icon(
                Icons.pending_actions_rounded,
              ),
            )
          : print("");
      psyNote == true
          ? list.add(
              Icon(Icons.border_color),
            )
          : print("");
    }
    return list;
  }

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
                  "$day",
                  style: TextStyle(
                    fontSize: 90,
                    fontWeight: FontWeight.w300,
                    color: Color(0xffD93657),
                  ),
                ),
                Text(
                  "$month",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  "$year",
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: bottomIcons(),
                ),
              ],
            ),
          ),
        ),
        height: 230,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
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
