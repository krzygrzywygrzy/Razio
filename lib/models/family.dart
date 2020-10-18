import 'package:mental_health/models/calendarNote.dart';
import 'package:mental_health/models/visits.dart';

class Family {
  String familyId,
      familyName,
      psyId,
      psychologistNames,
      usrId,
      userNames,
      invitationCode;
  List<CalendarNote> calendarNotes;
  List<Visit> visits;

  Family(this.familyId, this.familyName, this.psyId, this.psychologistNames,
      this.usrId, this.userNames, this.invitationCode, this.calendarNotes);

  Family.fromJson(Map<String, dynamic> json)
      : familyId = json['familyId'],
        familyName = json['familyName'],
        psyId = json['psyId'],
        psychologistNames = json["psychologistNames"],
        usrId = json['usrId'],
        userNames = json['userNames'],
        invitationCode = json['invitationCode'];
}
