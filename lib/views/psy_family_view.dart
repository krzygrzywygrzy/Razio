import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mental_health/components/avatar.dart';
import 'package:mental_health/components/user_dashboard.dart';
import 'package:mental_health/const.dart';
import 'package:mental_health/models/primaryData.dart';

class PsyFamilyView extends StatefulWidget {
  PsyFamilyView({this.index});
  final int index;
  @override
  _PsyFamilyViewState createState() => _PsyFamilyViewState();
}

class _PsyFamilyViewState extends State<PsyFamilyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: kGradientBg,
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 24,
                    bottom: 8,
                  ),
                  child: Avatar(
                    size: 100,
                  ),
                ),
                StoreConnector<PrimaryData, PrimaryData>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 8,
                        ),
                        child: Text(
                          state.families[widget.index].userNames,
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      );
                    },
                    converter: (store) => store.state),
                UserDashboard(
                  index: widget.index,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
