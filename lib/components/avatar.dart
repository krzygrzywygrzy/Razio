import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({@required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16, left: 24, right: 16),
      child: Container(
        height: size,
        width: size,
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
