import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mental_health/main.dart';
import 'package:mental_health/models/date.dart';
import 'package:mental_health/models/visits.dart';
import 'package:mental_health/redux/actions.dart';
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

  static Future getVisitsForMonth(var month, var famId, int index) async {
    var token = store.state.token;
    var api = '/api/Calendar/getVisitsForMonth';
    var headers = {
      HttpHeaders.authorizationHeader: "Bearer $token",
      'Content-Type': 'application/json',
    };
    var requestBody = jsonEncode(
      {
        "month": '$month',
        "familyId": '$famId',
      },
    );
    try {
      http
          .get(
        Uri.encodeFull("$URL" + "$api/$famId/$month/"),
        headers: headers,
      )
          .then(
        (response) {
          if (response.statusCode == 200) {
            var json = jsonDecode(response.body);
            List<Visit> vs = [];
            for (int i = 0; i <= json.length - 1; i++) {
              vs.add(json[i]);
              vs[i].date = Date.fromJson(json[i]["date"]);
            }
            store.dispatch(
              UpdateVisitList(payload: vs, index: index),
            );
          }
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
