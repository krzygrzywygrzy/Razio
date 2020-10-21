import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:mental_health/services/allert.dart';
import '../const.dart';
import '../main.dart';
import 'package:http/http.dart' as http;

class PNotesServices {
  static Future add(var message, BuildContext context) async {
    var token = store.state.token;
    var api = "/api/PrivateNotes/add";
    var requestBody = jsonEncode({"message": '$message'});
    var headers = {
      HttpHeaders.authorizationHeader: "Bearer $token",
      'Content-Type': 'application/json',
    };
    try {
      http
          .post(
        "$URL" + "$api",
        headers: headers,
        body: requestBody,
      )
          .then(
        (var response) {
          if (response.statusCode == 200) {
            print("Private note added");
          } else {
            allert("Wystąpił błąd z dodawaniem notatki do bazy", context);
          }
        },
      );
    } catch (e) {
      print(e);
    }
  }

  static Future edit(var message, BuildContext context) async {
    var api = "";
    //TODO: implement when api is done
  }
}
