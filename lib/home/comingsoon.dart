import 'package:flutter/material.dart';

class Comingsoon extends StatelessWidget {
  final String category;
  const Comingsoon({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text(
          '${category} Coming Soon',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}