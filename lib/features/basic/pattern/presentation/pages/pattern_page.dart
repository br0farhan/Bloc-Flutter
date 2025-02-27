import 'package:bloc_flutter/features/basic/pattern/presentation/pages/contact_page.dart';
import 'package:flutter/material.dart';

class PatternPage extends StatelessWidget {
  const PatternPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pattern Page'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.message),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const ContactPage(),
            ),
          );
        },
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This is the chatting Homepage',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
