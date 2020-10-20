import 'dart:convert';
import 'package:http/http.dart' as http;

import '../const.dart';

class SendEmail {
  static Future send(var email, var famId) async {
    var api = "/api/Family/sendMailWithCode";
    var requesBody = jsonEncode({"familyId": '$famId', "email": '$email'});

    try {
      http
          .post(
        Uri.encodeFull("$URL" + "$api"),
        body: requesBody,
        headers: HEADERS,
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
