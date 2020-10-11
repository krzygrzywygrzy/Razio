import 'package:flutter/material.dart';
import 'package:mental_health/components/button.dart';
import 'package:mental_health/components/input_field.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ListView(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                          tag: 'logo',
                          child: Image.asset(
                            "lib/assets/logo.png",
                            width: 100,
                            height: 100,
                          )),
                      Text(
                        "Razio",
                        style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 40,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  InputField(
                    obscure: false,
                    hint: "imię",
                  ),
                  InputField(
                    obscure: false,
                    hint: "nazwisko",
                  ),
                  InputField(
                    obscure: false,
                    hint: "login",
                  ),
                  InputField(
                    obscure: false,
                    hint: "email",
                  ),
                  InputField(
                    obscure: true,
                    hint: "hasło",
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Container(
                    color: Colors.blue,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Button(
                      label: "Zarejestruj",
                      toDo: () {
                        Navigator.pushNamed(context, '/dashbord');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
