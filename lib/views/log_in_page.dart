import 'package:flutter/material.dart';
import 'package:mental_health/components/button.dart';
import 'package:mental_health/components/input_field.dart';
import 'package:mental_health/models/painter.dart';

class LogInPage extends StatefulWidget {
  LogInPage({Key key}) : super(key: key);

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(),
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
                    Text(
                      "Razio",
                      style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 40,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InputField(
                      obscure: false,
                      hint: "login",
                    ),
                    InputField(
                      obscure: true,
                      hint: "hasło",
                    ),
                    //
                    //Zapomniałeś hasła?
                    //
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {},
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
                        Navigator.pushNamed(context, '/dashbord');
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
