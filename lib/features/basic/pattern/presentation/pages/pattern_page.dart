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
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ContactPage(),
                        ),
                      );
                    },
                    child: const Text("List Contact")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
