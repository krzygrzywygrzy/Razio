import 'package:flutter/material.dart';
import 'package:mental_health/models/primaryData.dart';
import 'package:mental_health/models/userInfo.dart';
import 'package:mental_health/redux/reducers.dart';
import 'package:mental_health/views/dashbord.dart';
import 'package:mental_health/views/log_in_page.dart';
import 'package:mental_health/views/private_notes_page.dart';
import 'package:mental_health/views/register_page.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

//kuba_zalek88@onet.pl

final store = new Store<PrimaryData>(reducer,
    initialState: PrimaryData(
      token: "",
      userInfo:
          UserInfo(id: "", firstName: "", surname: "", email: "", role: "USR"),
      privateNotes: [],
      families: [],
    ));
void main() {
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
        title: 'Razio',
        theme: ThemeData(
          textTheme: TextTheme(
            headline: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.w300),
          ),
          primaryColor: Color(0xffD93657),
          fontFamily: "Segoe UI",
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          '/': (context) => LogInPage(),
          '/dashboard': (context) => Dashbord(),
          '/register': (context) => RegisterPage(),
          '/privateNotes': (context) => PrivateNotesPage(),
        },
        initialRoute: '/',
      ),
    );
  }
}
