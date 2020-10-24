import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mental_health/components/interaction_components/button.dart';
import 'package:mental_health/components/interaction_components/input_field.dart';
import 'package:mental_health/services/allert.dart';
import 'package:mental_health/services/log_in.dart';

class LogInPage extends StatefulWidget {
  LogInPage({Key key}) : super(key: key);

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  String email = "", password = "";

  Future logIn() async {
    if (password != "" && EmailValidator.validate(email) == true) {
      await LogIn.logIn(email, password, context);
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
                  height: MediaQuery.of(context).size.height * 0.30,
                ),
              )),
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Hero(
                      tag: "logo",
                      child: Image.asset(
                        "lib/assets/logo.png",
                        width: 150,
                        height: 150,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Razjo",
                        style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 40,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w300),
                        children: [
                          TextSpan(
                            text: "alfa",
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InputField(
                      type: TextInputType.emailAddress,
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
                    //
                    //Zapomniałeś hasła?
                    //
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            //TODO: implement
                          },
                          child: RichText(
                            text: TextSpan(
                              text: "Zapomniałeś ",
                              style: TextStyle(color: Colors.black54),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "hasła",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor)),
                                TextSpan(
                                    text: "?",
                                    style: TextStyle(color: Colors.black54)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Button(
                      label: "Zaloguj",
                      toDo: () {
                        logIn();
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Button(
                      label: "Zarejestruj",
                      toDo: () {
                        Navigator.pushNamed(context, '/register');
                      },
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
