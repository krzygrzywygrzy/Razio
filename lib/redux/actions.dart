import 'package:mental_health/models/primaryData.dart';

class LogInState {
  final PrimaryData payload;
  LogInState(this.payload);
}

class EditName {
  final String payloadName;
  final String payloadSurname;

  EditName(this.payloadName, this.payloadSurname);
}
