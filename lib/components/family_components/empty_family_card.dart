import 'package:flutter/material.dart';
import 'package:mental_health/components/cards/colored_card.dart';
import 'package:mental_health/components/interaction_components/bottom_sheet.dart';
import 'package:mental_health/components/interaction_components/little_button.dart';

class EmptyFamilyLayout extends StatelessWidget {
  EmptyFamilyLayout({@required this.code, @required this.famIndex});
  final String code;
  final int famIndex;

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
                    child: Text('$code'),
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
                  ShowBottomSheet.bottomSheetEmail(context, famIndex);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
