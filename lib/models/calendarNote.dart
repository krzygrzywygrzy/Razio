class CalendarNote {
  int day, month, year;
  String message, userId, userRole;

  CalendarNote(this.day, this.month, this.year, this.message, this.userId,
      this.userRole);

  CalendarNote.fromJson(Map<String, dynamic> json)
      : day = json['day'],
        month = json['month'],
        year = json['year'],
        message = json['messasge'],
        userId = json['userId'],
        userRole = json['userRole'];
}
