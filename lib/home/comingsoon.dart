import 'package:flutter/material.dart';

class Comingsoon extends StatelessWidget {
  final String category;
  const Comingsoon({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Coming Soon',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}