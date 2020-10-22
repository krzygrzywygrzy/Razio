import 'date.dart';

class PrivateNote {
  String message, id;
  Date creationDate;

  PrivateNote({this.creationDate, this.message, this.id});

  PrivateNote.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        id = json["id"];
}
