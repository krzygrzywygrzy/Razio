import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mental_health/components/bottom_sheet.dart';
import 'package:mental_health/components/family_card.dart';
import 'package:mental_health/const.dart';
import 'package:mental_health/models/date.dart';
import 'package:mental_health/models/primaryData.dart';
import 'package:mental_health/models/visits.dart';

class FamiliesList extends StatelessWidget {
  String appointmentTime(List<Visit> visits) {
    String data = "";
    if (visits.length == 0) {
      data = "brak zaplanowanych wizyt";
    } else {
      List<Date> dates = [];
      for (int i = 0; i <= visits.length - 1; i++) {
        dates.add(visits[i].date);
      }
      List<DateTime> dateTimes = [];
      for (int i = 0; i <= dates.length - 1; i++) {
        DateTime d = DateTime(dates[i].year, dates[i].month, dates[i].day,
            dates[i].hour, dates[i].minute);
        if (!d.isBefore(DateTime.now())) dateTimes.add(d);
      }
      if (dateTimes != []) {
        DateTime earliest = dateTimes[0];

        for (int i = 0; i <= dateTimes.length - 2; i++) {
          if (dateTimes[i + 1].isBefore(dateTimes[i])) {
            earliest = dateTimes[i + 1];
          }
        }
        data =
            "${earliest.day}-${earliest.month}-${earliest.year}:${earliest.hour}:${earliest.minute}";
      } else {
        data = "brak zaplanowanych wizyt";
      }
    }
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
                    bottomSheetAddFamily(context);
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
                        return Container(
                          child: FamilyCard(
                            colors: kFamButtonsColors[0],
                            name: state.families[index].familyName,
                            appointment:
                                appointmentTime(state.families[index].visits),
                          ),
                        );
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
