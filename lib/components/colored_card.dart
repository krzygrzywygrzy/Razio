import 'package:flutter/material.dart';

class ColoredCard extends StatelessWidget {
  final Function onTap;
  ColoredCard({this.onTap});

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
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Twoje notatki",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                              letterSpacing: 1),
                        ),
                        Text(
                          "Tutaj masz podgląd to twoich osobistych notatek",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Color(0xffe6e6e6)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 4),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4),
                              child: Text("Sprawdź"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Icon(
                    Icons.event_note_rounded,
                    color: Colors.white,
                    size: 90,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
