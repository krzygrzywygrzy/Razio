import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mental_health/components/interaction_components/bottom_sheet.dart';
import 'package:mental_health/components/cards/colored_card.dart';
import 'package:mental_health/components/family_components/empty_family_card.dart';
import 'package:mental_health/components/family_components/family_card.dart';
import 'package:mental_health/const.dart';
import 'package:mental_health/models/primaryData.dart';
import 'package:mental_health/models/visits.dart';
import 'package:mental_health/views/psy_family_view.dart';

class FamiliesList extends StatefulWidget {
  FamiliesList({Key key}) : super(key: key);

  @override
  _FamiliesListState createState() => _FamiliesListState();
}

class _FamiliesListState extends State<FamiliesList> {
  String appointmentTime(List<Visit> visits) {
    //TODO: implement
    String data = "";
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Pacjenci",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      ShowBottomSheet.bottomSheetAddFamily(context);
                    });
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
                  return Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.families.length,
                      itemBuilder: (context, index) {
                        if (state.families[index].usrId != null) {
                          return Container(
                            child: ColoredCard(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) => PsyFamilyView(
                                          index: index,
                                        )),
                                  ),
                                );
                              },
                              child: FamilyCard(
                                colors: kFamButtonsColors[0],
                                name: state.families[index].familyName,
                                appointment: appointmentTime(
                                    state.families[index].visits),
                              ),
                            ),
                          );
                        } else {
                          return EmptyFamilyLayout(
                              code: state.families[index].invitationCode);
                        }
                      },
                    ),
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
      ),
    );
  }
}
