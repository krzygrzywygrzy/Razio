import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  InputField({this.obscure, this.hint, this.onChanged, this.type});
  final bool obscure;
  final String hint;
  final Function onChanged;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      padding: EdgeInsets.symmetric(vertical: 2),
      child: TextField(
        keyboardType: type,
        onChanged: onChanged,
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
