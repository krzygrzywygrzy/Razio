import 'package:flutter/material.dart';
import 'package:mental_health/models/primaryData.dart';
import 'package:mental_health/redux/reducers.dart';
import 'package:mental_health/views/dashbord.dart';
import 'package:mental_health/views/log_in_page.dart';
import 'package:mental_health/views/register_page.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  final store = new Store<PrimaryData>(reducer,
      initialState: PrimaryData(token: "Sprawa sie rypła"));

  runApp(MyApp(
    store: store,
  ));
}

class MyApp extends StatelessWidget {
  final Store<PrimaryData> store;

  MyApp({this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<PrimaryData>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mental Health',
        theme: ThemeData(
          primaryColor: Color(0xfff95a7b),
          fontFamily: "Segoe UI",
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          '/': (context) => LogInPage(),
          '/dashboard': (context) => Dashbord(),
          '/register': (context) => RegisterPage(),
        },
        initialRoute: '/',
      ),
    );
  }
}
