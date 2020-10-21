import 'package:mental_health/models/family.dart';
import 'package:mental_health/models/primaryData.dart';
import 'package:mental_health/models/privateNote.dart';

class LogInState {
  final PrimaryData payload;
  LogInState(this.payload);
}

class EditName {
  final String payloadName;
  final String payloadSurname;

  EditName(this.payloadName, this.payloadSurname);
}

class AddFamily {
  final Family payload;
  AddFamily(this.payload);
}

class AddPrivateNote {
  final PrivateNote payload;
  AddPrivateNote(this.payload);
}

class EditPrivateNote {
  final String message;
  final int index;
  EditPrivateNote({this.message, this.index});
}
