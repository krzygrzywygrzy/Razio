import 'package:flutter/material.dart';
import 'package:mental_health/components/cards/colored_card.dart';
import 'package:mental_health/components/interaction_components/bottom_sheet.dart';
import 'package:mental_health/components/interaction_components/little_button.dart';
import 'package:mental_health/redux/actions.dart';
import 'package:mental_health/services/family_services.dart';
import '../../main.dart';

class EmptyFamilyLayout extends StatefulWidget {
  EmptyFamilyLayout({@required this.code, @required this.famIndex});
  final String code;
  final int famIndex;

  @override
  _EmptyFamilyLayoutState createState() => _EmptyFamilyLayoutState();
}

class _EmptyFamilyLayoutState extends State<EmptyFamilyLayout> {
  dialog(context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Czy jesteś pewny?"),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "NIE",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 16,
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      Navigator.pop(context);
                      bool delete = await FamilyServices.delete(
                        store.state.families[widget.famIndex].familyId,
                        context,
                      );
                      //TODO: fix this to wait for the response
                      setState(() {
                        store.dispatch(
                          DeleteFamily(payload: widget.famIndex),
                        );
                      });
                    },
                    child: Text(
                      "TAK",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return ColoredCard(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text("Kod dostępu:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 8),
                    child: Text('${widget.code}'),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                ),
              ),
              LittleButton(
                label: "wyślij",
                onTap: () {
                  ShowBottomSheet.bottomSheetEmail(context, widget.famIndex);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16),
                child: Container(
                  child: GestureDetector(
                    onTap: () {
                      dialog(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
