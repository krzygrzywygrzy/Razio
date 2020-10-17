import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mental_health/models/primaryData.dart';

class Dashbord extends StatefulWidget {
  @override
  _DashbordState createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            decoration: BoxDecoration(
              color: Colors.red,
            ),
          ),
          Positioned(
            child: Container(),
          ),
          Positioned(
              top: 30,
              right: 0,
              left: 0,
              child: StoreConnector<PrimaryData, PrimaryData>(
                converter: (store) => store.state,
                builder: (context, state) {
                  return Text(state.token.toString());
                },
              )),
        ],
      ),
    );
  }
}
