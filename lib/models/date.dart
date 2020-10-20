class Date {
  String year, month, day, hour, minute;

  Date({this.year, this.month, this.day, this.hour, this.minute});

  Date.fromJson(Map<String, dynamic> json)
      : year = json["year"],
        month = json["month"],
        day = json["day"],
        hour = json["hour"],
        minute = json["minute"];
}
