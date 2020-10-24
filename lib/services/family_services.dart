import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:mental_health/const.dart';
import 'package:mental_health/main.dart';
import 'package:mental_health/models/family.dart';
import 'package:mental_health/redux/actions.dart';
import 'package:mental_health/services/allert.dart';

class FamilyServices {
  static Future add(String name, BuildContext context) async {
    var token = store.state.token;
    var api = '/api/Family/create';
    var requestBody = jsonEncode({"familyName": '$name'});
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
          var json = jsonDecode(response.body);
          Family fam = Family.fromJson(json);
          store.dispatch(AddFamily(fam));
        } else
          print(response.body);
      });
    } catch (e) {
      print(e);
    }
  }

  static Future join(var code, BuildContext context) async {
    var token = store.state.token;
    var api = '/api/Family/join';
    var requestBody = jsonEncode({"invitationCode": '$code'});
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
          var json = jsonDecode(response.body);
          Family fam = Family.fromJson(json);
          print(fam.familyId);
          store.dispatch(AddFamily(fam));
        } else {
          allert("Zły kod lub jesteś już w rodzinie", context);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<bool> delete(var famId, context) async {
    var token = store.state.token;
    var api = '/api/Family/delete';
    var headers = {
      HttpHeaders.authorizationHeader: "Bearer $token",
      'Content-Type': 'application/json',
    };
    try {
      http
          .delete(
        Uri.encodeFull("$URL" + "$api/$famId/"),
        headers: headers,
      )
          .then((response) {
        if (response.statusCode == 200) {
          print("Deleted!");
          return true;
        } else {
          var json = jsonDecode(response.body);
          allert(json["error"], context);
          return false;
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
