import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:mental_health/const.dart';
import 'package:mental_health/services/allert.dart';

import 'log_in.dart';

class Register {
  static Future register(var email, var password, var firstName, var surname,
      var role, context) async {
    String data = '';

    var api = '/api/User/register';
    var requestBody = jsonEncode({
      "email": '$email',
      "firstName": '$firstName',
      "surname": '$surname',
      "password": '$password',
      "role": '$role'
    });
    //TODO: show allerts
    print("Registering....");
    try {
      await http
          .post(Uri.encodeFull("$URL" + "$api"),
              body: requestBody, headers: HEADERS)
          .then((var response) {
        if (response.statusCode == 200) {
          //message

          LogIn.logIn(email, password, context);
          //
        } else if (response.statusCode == 400) {
          allert("Użytkownik o takim adresie e-mail już ustnieje ", context);
        } else
          allert("Coś poszło nie tak", context);
      });
    } catch (e) {}
  }
}
