import 'package:mental_health/models/calendarNote.dart';
import 'package:mental_health/models/family.dart';
import 'package:mental_health/models/primaryData.dart';
import 'package:mental_health/models/privateNote.dart';

//log in
class LogInState {
  final PrimaryData payload;
  LogInState(this.payload);
}

// edit users personal data
class EditName {
  final String payloadName;
  final String payloadSurname;

  EditName(this.payloadName, this.payloadSurname);
}

//add to family
class AddFamily {
  final Family payload;
  AddFamily(this.payload);
}

//add private note
class AddPrivateNote {
  final PrivateNote payload;
  AddPrivateNote(this.payload);
}

//edit private note
class EditPrivateNote {
  final String message;
  final int index;
  EditPrivateNote({this.message, this.index});
}

//add note to callendar
class AddNoteInCallendar {
  final CalendarNote payload;
  AddNoteInCallendar({this.payload});
}

// update notes list when month changed
class UpdateCalendarNotesList {
  final List<CalendarNote> payload;
  UpdateCalendarNotesList({this.payload});
}
