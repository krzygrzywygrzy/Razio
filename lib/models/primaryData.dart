import 'package:flutter/cupertino.dart';
import 'package:mental_health/models/family.dart';
import 'package:mental_health/models/privateNote.dart';
import 'package:mental_health/models/userInfo.dart';

class PrimaryData extends ChangeNotifier {
  String token;
  UserInfo userInfo;
  List<PrivateNote> privateNotes;
  List<Family> families;

  PrimaryData({this.token, this.families, this.privateNotes, this.userInfo});

  PrimaryData.fromJson(Map<String, dynamic> json) : token = json['token'];

  PrimaryData.fromPD(PrimaryData another) {
    token = another.token;
    userInfo = another.userInfo;
    privateNotes = another.privateNotes;
    families = another.families;
  }
}
