import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  InputField({this.obscure, this.hint});
  final bool obscure;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      padding: EdgeInsets.symmetric(vertical: 2),
      child: TextField(
        autofocus: false,
        cursorColor: Theme.of(context).primaryColor,
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: hint,
        ),
      ),
    );
  }
}
