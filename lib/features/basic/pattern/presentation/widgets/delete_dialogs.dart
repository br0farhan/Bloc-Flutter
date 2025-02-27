import 'package:bloc_flutter/features/basic/pattern/data/models/contact_pattern_model.dart';
import 'package:bloc_flutter/features/basic/pattern/presentation/blocs/contact_pattern_event.dart';
import 'package:bloc_flutter/features/basic/pattern/presentation/blocs/contact_pattern_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final ContactPatternModel contact;

  const DeleteConfirmationDialog({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Confrim Delete"),
      content: Text.rich(
        TextSpan(
          text: "Are you sure you want to delete ",
          style: const TextStyle(color: Colors.black), 
          children: [
            TextSpan(
              text: contact.contactName,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.red), 
            ),
            const TextSpan(text: "?"),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("No"),
        ),
        TextButton(
          onPressed: () {
            context
                .read<ContactPatternBloc>()
                .add(DeleteContacts([contact])); // Hapus kontak
            Navigator.pop(context); // Tutup dialog setelah menghapus
          },
          child: const Text("Yes", style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
