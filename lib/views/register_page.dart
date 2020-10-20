import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mental_health/components/interaction_components/button.dart';
import 'package:mental_health/components/interaction_components/input_field.dart';
import 'package:email_validator/email_validator.dart';
import 'package:mental_health/models/primaryData.dart';
import 'package:mental_health/redux/actions.dart';
import 'package:mental_health/services/allert.dart';
import 'package:mental_health/services/log_in.dart';
import 'package:mental_health/services/register.dart';
import 'package:mental_health/const.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String name = "", surname = "", email = "", password = "", role;
  int radioValue = 1;

  Future register() async {
    if (radioValue == 0)
      role = USER_ROLE;
    else
      role = PSY_ROLE;

    if (name != "" &&
        surname != "" &&
        password != "" &&
        EmailValidator.validate(email) == true) {
      try {
        String response =
            await Register.register(email, password, name, surname, role);
        if (response == "200") {
          PrimaryData pd = await LogIn.logIn(email, password);
          //add to store
          StoreProvider.of<PrimaryData>(context).dispatch(LogInState(pd));
          Navigator.pushNamed(context, "/dashboard");
        } else if (response == "500") {
          print(response);
          allert("Coś poszło nie tak", context);
        } else {
          allert("Użytkownik o takim adresie e-mail istnieje!", context);
          print(response);
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                child: Image.asset(
                  "lib/assets/top.png",
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
              )),
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
                    height: 80,
                  ),
                  InputField(
                    obscure: false,
                    hint: "imię",
                    onChanged: (value) {
                      name = value;
                    },
                  ),
                  InputField(
                    obscure: false,
                    hint: "nazwisko",
                    onChanged: (value) {
                      surname = value;
                    },
                  ),
                  InputField(
                    obscure: false,
                    hint: "email",
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  InputField(
                    obscure: true,
                    hint: "hasło",
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                  Row(
                    children: [
                      Text(
                        "Użytkownik",
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                      ),
                      Radio(
                          activeColor: Theme.of(context).primaryColor,
                          value: 0,
                          groupValue: radioValue,
                          onChanged: (value) {
                            setState(() {
                              radioValue = value;
                            });
                          }),
                      Text(
                        "Psycholog",
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                      ),
                      Radio(
                          activeColor: Theme.of(context).primaryColor,
                          value: 1,
                          groupValue: radioValue,
                          onChanged: (value) {
                            setState(() {
                              radioValue = value;
                            });
                          }),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1),
                    child: Button(
                      label: "Zarejestruj",
                      toDo: () {
                        register();
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
