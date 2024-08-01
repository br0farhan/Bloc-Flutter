import 'package:bloc_flutter/bloc/counter.dart';
import 'package:bloc_flutter/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: BlocProvider(
        child: const HomePage(),
        create: (context) => Counter(),
        ),
    );
  }
}
