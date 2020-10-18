import 'date.dart';

class Visit {
  String familyId, message;
  Date date;

  Visit({this.familyId, this.message, this.date});

  Visit.fromJson(Map<String, dynamic> json)
      : familyId = json["familyId"],
        message = json["message"];
}
