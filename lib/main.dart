import 'package:flutter/material.dart';
import 'package:mental_health/views/dashbord.dart';
import 'package:mental_health/views/log_in_page.dart';
import 'package:mental_health/views/register_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mental Health',
      theme: ThemeData(
        primaryColor: Color(0xfff95a7b),
        fontFamily: "Segoe UI",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => LogInPage(),
        '/dashbord': (context) => Dashbord(),
        '/register': (context) => RegisterPage(),
      },
      initialRoute: '/',
    );
  }
}
