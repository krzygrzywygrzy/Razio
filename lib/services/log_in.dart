import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:mental_health/const.dart';
import 'package:mental_health/models/calendarNote.dart';
import 'package:mental_health/models/date.dart';
import 'package:mental_health/models/family.dart';
import 'package:mental_health/models/primaryData.dart';
import 'package:mental_health/models/privateNote.dart';
import 'package:mental_health/models/userInfo.dart';
import 'package:mental_health/models/visits.dart';
import 'package:mental_health/redux/actions.dart';
import 'package:mental_health/services/allert.dart';
import 'package:mental_health/views/dashbord.dart';

class LogIn {
  static Future logIn(var email, var password, BuildContext context) async {
    var api = "/api/User/login";
    var requestBody = jsonEncode({"email": '$email', "password": '$password'});

    print("Logowanie....");
    try {
      await http
          .post(
        Uri.encodeFull("$URL" + "$api"),
        body: requestBody,
        headers: HEADERS,
      )
          .then((var response) {
        if (response.statusCode == 200) {
          PrimaryData primaryData;
          var json = jsonDecode(response.body);
          primaryData = new PrimaryData.fromJson(json);

          //fetch user info
          primaryData.userInfo = new UserInfo.fromJson(json['userInfo']);

          //fetch privateNote
          List<PrivateNote> pn = [];
          if (json["privateNotes"] != 0) {
            for (int i = 0; i <= json["privateNotes"].length - 1; i++) {
              PrivateNote note = PrivateNote.fromJson(json["privateNotes"][i]);
              note.creationDate =
                  Date.fromJson(json["privateNotes"][i]["creationDate"]);
              pn.add(note);
            }
          }
          primaryData.privateNotes = pn;

          //fetch families
          List<Family> f = [];

          for (int i = 0; i <= json["families"].length - 1; i++) {
            Family fam = Family.fromJson(json["families"][i]);

            List<CalendarNote> cn = [];

            if (json["families"][i]["calendarNotes"].length != 0) {
              for (int j = 0;
                  j <= json["families"][i]["calendarNotes"].length - 1;
                  j++) {
                cn.add(CalendarNote.fromJson(
                    json["families"][i]["calendarNotes"][j]));
                Date date = Date.fromJson(
                    json["families"][i]["calendarNotes"][j]["date"]);
                cn[j].date = date;
              }
            }

            List<Visit> vs = [];
            if (json["families"][i]["visits"].length != 0) {
              for (int k = 0;
                  k <= json["families"][i]["visits"].length - 1;
                  k++) {
                vs.add(Visit.fromJson(json["families"][i]["visits"][k]));
                Date date =
                    Date.fromJson(json["families"][i]["visits"][k]["date"]);
                vs[k].date = date;
              }
            }

            fam.calendarNotes = cn;
            fam.visits = vs;
            f.add(fam);
          }
          primaryData.families = f;
          //add data to redux store
          StoreProvider.of<PrimaryData>(context)
              .dispatch(LogInState(primaryData));
          //go to dashboard
          Navigator.pushNamedAndRemoveUntil(
              context, '/dashboard', (Route<dynamic> route) => false);
        } else {
          print(response.statusCode);

          allert("Wystąpił problem", context);
        }
      });
    } catch (e) {
      print("Error: $e");
    }
  }
}
