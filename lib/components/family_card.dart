import 'package:flutter/material.dart';

class FamilyCard extends StatelessWidget {
  FamilyCard({this.colors});

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: GestureDetector(
        child: Container(
          child: Row(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 16, bottom: 16, left: 24, right: 16),
                        child: Container(
                          height: 60,
                          width: 60,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: NetworkImage(
                                    "https://samequizy.pl/wp-content/uploads/2016/03/filing_images_27b2790a29f1.jpg"),
                              )),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jan Bednarz",
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 1,
                              fontSize: 19,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.pending_actions_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                              Text(
                                " - 19.10.2020",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: colors[0],
                spreadRadius: 0.2,
                blurRadius: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
