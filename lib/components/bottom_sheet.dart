import 'package:flutter/material.dart';
import 'package:mental_health/components/button.dart';
import 'package:mental_health/components/input_field.dart';

void settingModalBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Text("Dodaj nowego pacjęta"),
                InputField(
                  hint: "Podaj nazwę:",
                  obscure: false,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Button(label: "Dodaj"),
                ),
              ],
            ),
          ),
        );
      });
}
