import 'package:flutter/material.dart';

class LittleButton extends StatelessWidget {
  LittleButton({this.onTap, this.label});
  final Function onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
            child: Text('$label'),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
