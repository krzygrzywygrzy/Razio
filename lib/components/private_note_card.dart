import 'package:flutter/material.dart';

class PrivateNoteCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Color(0xffd9d9d9),
                spreadRadius: 0.2,
                blurRadius: 4,
              ),
            ]),
        width: 250,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Tytuł"),
            ],
          ),
        ),
      ),
    );
  }
}
