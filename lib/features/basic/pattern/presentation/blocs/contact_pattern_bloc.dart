import 'dart:async';

import 'package:bloc_flutter/features/basic/pattern/data/models/contact_pattern_model.dart';
import 'package:bloc_flutter/features/basic/pattern/presentation/blocs/contact_pattern_event.dart';
import 'package:bloc_flutter/features/basic/pattern/presentation/blocs/contact_pattern_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactPatternBloc
    extends Bloc<ContactPatternEvent, ContactPatternState> {
  List<ContactPatternModel> _contacts = []; // Simpan daftar kontak di sini

  ContactPatternBloc() : super(ContactLoading()) {
    on<LoadContacts>((event, emit) async {
      emit(ContactLoading());

      await Future.delayed(const Duration(seconds: 1));

      _contacts = [
        ContactPatternModel('Vino G Bastian', 'assets/icons/ic_man.png', 'Men'),
        ContactPatternModel(
            'Anya Geraldine', 'assets/icons/ic_woman1.png', 'Girls'),
        ContactPatternModel(
            'Aura Kasih', 'assets/icons/ic_woman2.png', 'Girls'),
        ContactPatternModel(
            'Wika Salim', 'assets/icons/ic_woman3.png', 'Girls'),
        ContactPatternModel(
            'Melly 3 Gp', 'assets/icons/ic_woman4.png', 'Girls'),
      ];

      if (_contacts.isEmpty) {
        emit(ContactEmpty());
      } else {
        emit(ContactLoaded(List.from(_contacts)));
      }
    });

    on<DeleteContacts>((event, emit) {
      _contacts.removeWhere((contact) => event.contact.contains(contact));
      if (_contacts.isEmpty) {
        emit(ContactEmpty());
      } else {
        emit(ContactLoaded(
            List.from(_contacts))); // Update state dengan daftar baru
      }
    });
  }
}
