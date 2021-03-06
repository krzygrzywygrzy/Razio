import 'package:flutter/material.dart';
import 'package:mental_health/components/avatar.dart';

class FamilyCard extends StatelessWidget {
  FamilyCard({this.colors, this.name, this.appointment, this.onTap});
  final String name;
  final List<Color> colors;
  final String appointment;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Avatar(
                  size: 60,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$name",
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1,
                        fontSize: 19,
                      ),
                    ),
                    Text(
                      "Kliknij by przejść do szczegółów",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
