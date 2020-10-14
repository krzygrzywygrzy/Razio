import 'package:mental_health/models/calendarNote.dart';
import 'package:mental_health/models/family.dart';
import 'package:mental_health/models/userInfo.dart';

class PrimaryData {
  String token;
  UserInfo userInfo;
  List<CalendarNote> calendarNotes;
  List<Family> families;

  PrimaryData(this.token, this.userInfo, this.calendarNotes, this.families);

  PrimaryData.fromJson(Map<String, dynamic> json) : token = json['token'];
}
