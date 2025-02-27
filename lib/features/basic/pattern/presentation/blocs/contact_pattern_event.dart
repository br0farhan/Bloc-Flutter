import 'package:bloc_flutter/features/basic/pattern/data/models/contact_pattern_model.dart';

abstract class ContactPatternEvent {}

class LoadContacts extends ContactPatternEvent {}

// ignore: camel_case_types
class DeleteContacts extends ContactPatternEvent {
  final List<ContactPatternModel> contact;
  DeleteContacts(this.contact);
}