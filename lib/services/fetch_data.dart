import 'dart:convert';
import 'package:mental_health/models/primaryData.dart';
import 'package:mental_health/models/privateNote.dart';
import 'package:mental_health/models/userInfo.dart';

PrimaryData fetchPrimaryData(var data) {
  var json = jsonDecode(data);
  PrimaryData primaryData;
  primaryData = new PrimaryData.fromJson(json);

  //fetch user info
  primaryData.userInfo = new UserInfo.fromJson(json['userInfo']);

  //fetch privateNote
  List<PrivateNote> pn = [];
  for (int i = 0; i <= json["privateNotes"].length - 1; i++) {
    pn.add(PrivateNote.fromJson(json["calendarNote"][i]));
  }
  primaryData.privateNotes = pn;

  //fetch families
  // List<Family> f = [];

  // for (int i = 0; i <= json["families"].length - 1; i++) {
  //   List<CalendarNote> cn = [];
  //   for (int j = 0; j <= json["families"][i]["calendarNotes"].length - 1; j++) {
  //     cn.add(CalendarNote.fromJson(json["families"][i]["calendarNotes"][j]));
  //     Date date = Date.fromJson(json["families"][i]["calendarNotes"]["date"]);
  //     cn[i].date = date;
  //   }
  //   List<Visit> vs = [];
  //   for (int k = 0; k <= json["families"][i]["visits"].length; k++) {
  //     vs.add(Visit.fromJson(json["families"][i]["visits"][k]));
  //     Date date = Date.fromJson(json["families"][i]["visits"]["date"]);
  //     vs[i].date = date;
  //   }
  //   Family fam = Family.fromJson(json["families"][i]);
  //   fam.calendarNotes = cn;
  //   fam.visits = vs;
  //   f.add(fam);
  // }
  // primaryData.families = f;
  return null;
}
