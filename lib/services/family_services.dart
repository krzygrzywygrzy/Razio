import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:mental_health/const.dart';
import 'package:mental_health/main.dart';

class Family {
  static Future add(var name) async {
    var token = store.state.token;

    var api = '/api/Family/create';
    var requestBody = jsonEncode({"familyName": '$name'});
    var headers = {"Authentication": 'Bearer $token'};

    try {
      http
          .post(
        Uri.encodeFull("$URL" + "$api"),
        body: requestBody,
        headers: headers,
      )
          .then((var response) {
        if (response.statusCode == 200) {
          print(response);
        } else
          print(response.statusCode);
      });
    } catch (e) {
      print(e);
    }
  }

  static Future join(var code) async {
    var token = store.state.token;
    print(token);

    var api = '/api/Family/join';
    var requestBody = jsonEncode({"invitationCode": '$code'});
    var headers = {"Authentication": 'Bearer $token'};

    try {
      http
          .post(
        Uri.encodeFull("$URL" + "$api"),
        body: requestBody,
        headers: headers,
      )
          .then((var response) {
        if (response.statusCode == 200) {
          print(response);
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
