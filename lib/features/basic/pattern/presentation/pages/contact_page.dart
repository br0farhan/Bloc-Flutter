import 'package:bloc_flutter/features/basic/pattern/presentation/blocs/contact_pattern_event.dart';
import 'package:bloc_flutter/features/basic/pattern/presentation/blocs/contact_pattern_state.dart';
import 'package:bloc_flutter/features/basic/pattern/presentation/widgets/delete_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_flutter/features/basic/pattern/presentation/blocs/contact_pattern_bloc.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Contact'),
      ),
      body: BlocProvider(
        create: (context) => ContactPatternBloc()..add(LoadContacts()),
        child: BlocBuilder<ContactPatternBloc, ContactPatternState>(
          builder: (context, state) {
            if (state is ContactLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ContactEmpty) {
              return const Center(
                child: Text('No Contacts Available',
                    style: TextStyle(fontSize: 18)),
              );
            } else if (state is ContactLoaded) {
              return ListView.builder(
                itemCount: state.contacts.length,
                itemBuilder: (context, index) {
                  final contact = state.contacts[index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: ClipOval(
                        child:
                            Image(image: AssetImage(contact.contactImageUrl)),
                      ),
                    ),
                    title: Text(contact.contactName),
                    subtitle: Text(contact.contactStatus),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (dialogContext) => BlocProvider.value(
                            value: context.read<
                                ContactPatternBloc>(), // Pastikan Bloc tetap tersedia
                            child: DeleteConfirmationDialog(contact: contact),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
