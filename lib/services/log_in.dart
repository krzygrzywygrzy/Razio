import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:mental_health/const.dart';
import 'package:mental_health/models/calendarNote.dart';
import 'package:mental_health/models/family.dart';
import 'package:mental_health/models/primaryData.dart';
import 'package:mental_health/models/privateNote.dart';
import 'package:mental_health/models/userInfo.dart';

class LogIn {
  static Future<dynamic> logIn(var email, var password) async {
    var api = "/api/User/login";
    var requestBody = jsonEncode({"email": '$email', "password": '$password'});
    var data;
    try {
      await http
          .post(
        Uri.encodeFull("$URL" + "$api"),
        body: requestBody,
        headers: HEADERS,
      )
          .then((var response) {
        if (response.statusCode == 200) {
          data = response.body;
          PrimaryData primaryData;
          var json = jsonDecode(response.body);
          primaryData = new PrimaryData.fromJson(json);

          //fetch user info
          primaryData.userInfo = new UserInfo.fromJson(json['userInfo']);

          //fetch privateNote
          List<PrivateNote> pn = [];
          for (int i = 0; i <= json["privateNotes"].length - 1; i++) {
            pn.add(PrivateNote.fromJson(json["calendarNote"][i]));
          }
          primaryData.privateNotes = pn;

          //fetch families
          List<Family> f = [];

          for (int i = 0; i <= json["families"].length - 1; i++) {
            List<CalendarNote> cn = [];
            for (int j = 0;
                j <= json["families"][i]["calendarNotes"].length - 1;
                j++) {
              cn.add(CalendarNote.fromJson(
                  json["families"][i]["calendarNotes"][j]));
            }
            Family fam = Family.fromJson(json["families"][i]);
            fam.calendarNotes = cn;
            f.add(fam);
          }
          primaryData.families = f;

          data = primaryData;
        } else {
          //if error return statusCode
          data = response.statusCode.toString();
        }
      });
    } catch (e) {
      print("Error: " + e);
    }

    return data;
  }
}
