import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mental_health/main.dart';
import 'package:mental_health/models/date.dart';
import 'package:mental_health/services/allert.dart';

import '../const.dart';

class VisitsServices {
  static Future add(
    context,
    var familyId,
    var message,
    Date date,
  ) async {
    var token = store.state.token;
    var api = '/api/Calendar/addVisit';
    var headers = {
      HttpHeaders.authorizationHeader: "Bearer $token",
      'Content-Type': 'application/json',
    };
    var requesBody = jsonEncode(
      {
        "familyId": '$familyId',
        "message": '$message',
        'date': {
          "year": '${date.year}',
          "month": '${date.month}',
          "day": '${date.day}',
          "hour": '${date.hour}',
          "minute": '${date.minute}',
        },
      },
    );
    try {
      http
          .post(
        Uri.encodeFull("$URL" + "$api"),
        body: requesBody,
        headers: headers,
      )
          .then((var response) {
        if (response.statusCode == 200) {
          print("Success!");
        } else {
          print(response.statusCode);
          allert("Wystąpił problem z dodaniem wizyty do bazy!", context);
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
