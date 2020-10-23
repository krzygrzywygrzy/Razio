import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mental_health/components/interaction_components/button.dart';
import 'package:mental_health/components/interaction_components/input_field.dart';
import 'package:mental_health/services/allert.dart';
import 'package:mental_health/services/family_services.dart';
import 'package:mental_health/main.dart';
import 'package:mental_health/services/send_email.dart';

class ShowBottomSheet {
  static void bottomSheetAddFamily(context) {
    var name = '';
    String hint;
    String title;
    store.state.userInfo.role == "USR"
        ? hint = "podaj kod"
        : hint = "podaj imię i nazwisko";

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

  static void bottomSheetEmail(context, index) {
    String email = "";
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Text("Wyślij e-mail z kodem"),
                  InputField(
                    type: TextInputType.emailAddress,
                    hint: "e-mail",
                    obscure: false,
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Button(
                      label: "Wyślij",
                      toDo: () {
                        if (EmailValidator.validate(email)) {
                          SendEmail.send(
                              email, store.state.families[index].familyId);
                          Navigator.pop(context);
                        } else {
                          allert("Wprowadź poprawny adres!", context);
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
