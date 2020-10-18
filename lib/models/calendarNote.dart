import 'date.dart';

class CalendarNote {
  Date date;
  String message, userId, userRole;

  CalendarNote({this.message, this.userId, this.userRole});

  CalendarNote.fromJson(Map<String, dynamic> json)
      : message = json['messasge'],
        userId = json['userId'],
        userRole = json['userRole'];
}
