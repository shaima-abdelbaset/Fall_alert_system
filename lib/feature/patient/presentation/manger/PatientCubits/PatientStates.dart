import 'package:fall_detection/feature/patient/data/model/PatientModel.dart';

abstract class PatientState{}

class PatientInitial extends PatientState {}

class PatientLoading extends PatientState {}

class PatientLoaded extends PatientState {
  final User patient;

   PatientLoaded(this.patient);


}

class PatientError extends PatientState {
  final String message;

   PatientError(this.message);


}