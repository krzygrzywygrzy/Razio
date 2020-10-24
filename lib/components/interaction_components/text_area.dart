import 'package:flutter/material.dart';

class TextArea extends StatelessWidget {
  const TextArea({
    @required this.message,
    this.onChanged,
    @required this.enabled,
    this.flex,
    this.hint,
    this.saveButtonAction,
  });

  final String message;
  final Function onChanged;
  final Function saveButtonAction;
  final bool enabled;
  final num flex;
  final String hint;

  String hideSaveButton() {
    if (enabled == true)
      return "zapisz";
    else
      return "";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * flex,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0xffc9c9c9),
                blurRadius: 5,
                spreadRadius: 0.2,
              ),
            ],
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 16, right: 16, bottom: 30),
                child: TextFormField(
                  enabled: enabled,
                  initialValue: message,
                  cursorColor: Theme.of(context).primaryColor,
                  maxLines: null,
                  onChanged: this.onChanged,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: "$hint",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Positioned(
                bottom: 24,
                right: 24,
                child: GestureDetector(
                  onTap: () async {
                    saveButtonAction();
                  },
                  child: Text(hideSaveButton()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
