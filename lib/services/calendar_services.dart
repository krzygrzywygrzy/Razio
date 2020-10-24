import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mental_health/main.dart';
import 'package:http/http.dart' as http;
import 'package:mental_health/models/calendarNote.dart';
import 'package:mental_health/models/date.dart';
import 'package:mental_health/redux/actions.dart';
import 'package:mental_health/services/allert.dart';
import '../const.dart';

var token = store.state.token;

class CalendarServices {
  static Future addNote(
      var familyId, var message, BuildContext context, int index) async {
    var api = "/api/Calendar/addNote";
    var requestBody =
        jsonEncode({"familyId": '$familyId', "message": '$message'});
    var headers = {
      HttpHeaders.authorizationHeader: "Bearer $token",
      'Content-Type': 'application/json',
    };
    try {
      http
          .post(
        Uri.encodeFull("$URL" + "$api"),
        body: requestBody,
        headers: headers,
      )
          .then((var response) {
        if (response.statusCode == 200) {
          print("Notatka dodana");
          return response.body;
        } else {
          allert("Wystąpił błąd przy dodawaniu notatki do bazy!", context);
          return null;
        }
      });
    } catch (e) {
      print(e);
    }
  }

  static Future getNotesForMonth(
      var familyId, var month, int index, BuildContext context) async {
    var api = "/api/Calendar/getNotesForMonth";

    var headers = {
      HttpHeaders.authorizationHeader: "Bearer $token",
      'Content-Type': 'application/json',
    };
    try {
      http
          .get(
        Uri.encodeFull("$URL" + "$api/$familyId/$month/"),
        headers: headers,
      )
          .then((var response) {
        if (response.statusCode == 200) {
          var json = jsonDecode(response.body);
          if (json.length != 0) {
            List<CalendarNote> cn = [];
            for (int i = 0; i <= json.length - 1; i++) {
              cn.add(
                CalendarNote.fromJson(
                  json[i],
                ),
              );
              cn[i].date = Date.fromJson(json[i]["date"]);
            }

            store.dispatch(
              UpdateCalendarNotesList(payload: cn, index: index),
            );

            print("Pobrano notatki!");
          }
        } else {
          allert("Wystąpił błąd w pobieraniu notatek!", context);
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
