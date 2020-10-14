import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:mental_health/const.dart';

class LogIn {
  Future<String> logIn(var email, var password) async {
    var api = "/api/User/login";
    var requestBody = jsonEncode({"email": '$email', "password": '$password'});
    String data = '';
    try {
      await http
          .post(
        Uri.encodeFull("$URL" + "$api"),
        body: requestBody,
      )
          .then((var response) {
        if (response.statusCode == 200) {
          data = response.body;
        }
      });
    } catch (e) {
      print("Sprawa sie rypła");
    }
    return data;
  }
}
