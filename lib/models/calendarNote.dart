class CalendarNote {
  int day, month, year;
  String message;

  CalendarNote(this.day, this.month, this.year, this.message);

  CalendarNote.fromJson(Map<String, dynamic> json)
      : day = json['day'],
        month = json['month'],
        year = json['year'],
        message = json['messasge'];
}
