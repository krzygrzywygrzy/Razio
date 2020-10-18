import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mental_health/components/bottom_sheet.dart';
import 'package:mental_health/models/primaryData.dart';

class FamiliesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Pacjęci",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: GestureDetector(
                onTap: () {
                  settingModalBottomSheet(context);
                },
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
        Container(
          child: StoreConnector<PrimaryData, PrimaryData>(
            converter: (store) => store.state,
            builder: (context, state) {
              if (state.families.length != 0) {
                return ListView.builder(
                  itemCount: state.families.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Text(state.families[index].familyName),
                      //TODO:
                    );
                  },
                );
              } else {
                return Container(
                  child: Text("Nie masz jeszcze pacjentów"),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
