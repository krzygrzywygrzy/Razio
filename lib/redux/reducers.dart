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
  return newState;
}