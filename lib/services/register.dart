import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:mental_health/const.dart';

class Register {
  static Future<String> register(
      var email, var password, var firstName, var surname, var role) async {
    String data = '';
    print("działa");
    var api = '/api/User/register';
    var requestBody = jsonEncode({
      "email": '$email',
      "firstName": '$firstName',
      "surname": '$surname',
      "password": '$password',
      "role": '$role'
    });

    try {
      await http
          .post(Uri.encodeFull("$URL" + "$api"),
              body: requestBody, headers: HEADERS)
          .then((var response) {
        if (response.statusCode == 200) {
          //message
          var json = jsonDecode(response.body);
          print(json['message']);
          //
        } else
          print(response.statusCode);
        data = response.statusCode.toString();
      });
    } catch (e) {
      print(e);
    }

    return data;
  }
}
