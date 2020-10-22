class Date {
  int year, month, day, hour, minute;

  Date({this.year, this.month, this.day, this.hour, this.minute});

  Date.fromJson(Map<String, dynamic> json)
      : year = int.parse(json["year"]),
        month = int.parse(json["month"]),
        day = int.parse(json["day"]),
        hour = int.parse(json["hour"]),
        minute = int.parse(json["minute"]);
}
