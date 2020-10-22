import 'package:flutter/material.dart';
import 'package:mental_health/components/interaction_components/button.dart';
import 'package:mental_health/components/interaction_components/input_field.dart';
import 'package:mental_health/services/family_services.dart';
import 'package:mental_health/main.dart';

class ShowBottomSheet {
  static void bottomSheetAddFamily(context) {
    var name = '';
    String hint;
    String title;
    store.state.userInfo.role == "USR"
        ? hint = "podaj kod"
        : hint = "podaj nazwe";

    store.state.userInfo.role == "USR"
        ? title = "Dołącz do terapeuty"
        : title = "Dodaj nowego pacjęta";

    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Text("$title"),
                  InputField(
                    hint: hint,
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
                          store.state.userInfo.role == "USR"
                              ? await FamilyServices.join(name, context)
                              : await FamilyServices.add(name, context);
                          Navigator.pop(context);
                        }),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
