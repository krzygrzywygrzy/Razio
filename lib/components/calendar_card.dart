import 'package:flutter/material.dart';

class CalendarCard extends StatelessWidget {
  const CalendarCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 230,
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
    );
  }
}
