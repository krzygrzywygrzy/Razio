import 'package:mental_health/models/primaryData.dart';
import 'actions.dart';

PrimaryData reducer(PrimaryData prevState, dynamic action) {
  PrimaryData newState = PrimaryData.fromPD(prevState);
  if (action is LogInState) {
    newState = action.payload;
  }
  if (action is AddFamily) {
    newState.families.add(action.payload);
  }
  if (action is AddPrivateNote) {
    newState.privateNotes.add(action.payload);
  }
  if (action is EditPrivateNote) {
    newState.privateNotes[action.index].message = action.message;
  }
  if (action is AddNoteInCallendar) {
    newState.families[action.index].calendarNotes.add(action.payload);
  }
  if (action is AddVisit) {
    newState.families[action.index].visits.add(action.payload);
  }
  if (action is UpdateCalendarNotesList) {
    newState.families[action.index].calendarNotes = action.payload;
  }
  if (action is UpdateVisitList) {
    newState.families[action.index].visits = action.payload;
  }
  if (action is DeleteFamily) {
    newState.families.removeAt(action.payload);
  }

  return newState;
}
