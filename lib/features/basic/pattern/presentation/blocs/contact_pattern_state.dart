import 'package:bloc_flutter/features/basic/pattern/data/models/contact_pattern_model.dart';

abstract class ContactPatternState {}

class ContactLoading extends ContactPatternState {}

class ContactLoaded extends ContactPatternState {
  final List<ContactPatternModel> contacts;
  ContactLoaded(this.contacts);
}

class ContactEmpty extends ContactPatternState {}
