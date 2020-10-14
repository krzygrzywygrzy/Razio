import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:mental_health/const.dart';

class Register {
  Future<String> register(var email, var password, var role) async {
    String data = '';
    var api = '/api/User/register';
    var requestBody =
        jsonEncode({"email": '$email', "password": '$password', "role": 'USR'});

    try {
      await http
          .post(Uri.encodeFull("$URL" + "$api"),
              body: requestBody, headers: HEADERS)
          .then((var response) {
        //message
        var json = jsonDecode(response.body);
        print(json['message']);
        //
        data = response.statusCode.toString();
      });
    } catch (e) {
      print(e);
    }

    return data;
  }
}
