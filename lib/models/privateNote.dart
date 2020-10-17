class PrivateNote {
  String message;
  DateTime creationDate;

  PrivateNote(this.creationDate, this.message);

  PrivateNote.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        creationDate = json['creationDate'];

  List<PrivateNote> listFromJson(List<dynamic> json) {
    return json == null
        ? List<PrivateNote>()
        : json.map((value) => PrivateNote.fromJson(value)).toList();
  }
}
