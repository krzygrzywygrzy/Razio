import 'package:flutter/material.dart';
import 'package:mental_health/components/button.dart';
import 'package:mental_health/components/input_field.dart';
import 'package:mental_health/models/family.dart';
import 'package:mental_health/services/family_services.dart';

void bottomSheetAddFamily(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        String name = "";
        return Container(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Text("Dodaj nowego pacjęta"),
                InputField(
                  hint: "Podaj nazwę:",
                  obscure: false,
                  onChanged: (value) {
                    name = value;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Button(
                    label: "Dodaj",
                    toDo: () async {
                      await FamilyServices.add(name);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
