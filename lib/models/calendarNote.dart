import 'date.dart';

class CalendarNote {
  Date date;
  String message, userId, userRole;

  CalendarNote({this.message, this.userId, this.userRole, this.date});

  CalendarNote.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        userId = json['userId'],
        userRole = json['userRole'];
}
