import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mental_health/main.dart';
import '../const.dart';

class SendEmail {
  static Future send(var email, var famId) async {
    var token = store.state.token;
    var api = "/api/Family/sendMailWithCode";
    var requesBody = jsonEncode({"familyId": '$famId', "email": '$email'});
    var headers = {
      HttpHeaders.authorizationHeader: "Bearer $token",
      'Content-Type': 'application/json',
    };
    try {
      http
          .post(
        Uri.encodeFull("$URL" + "$api"),
        body: requesBody,
        headers: headers,
      )
          .then((var response) {
        if (response.statusCode == 200) {
          print("Email sent!!!");
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
