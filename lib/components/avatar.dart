import 'package:flutter/material.dart';

class Awatar extends StatelessWidget {
  const Awatar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16, left: 24, right: 16),
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
    );
  }
}
