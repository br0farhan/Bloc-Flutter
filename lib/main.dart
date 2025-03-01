import 'package:bloc_flutter/features/basic/counter/presentation/blocs/counter.dart';
import 'package:bloc_flutter/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child:  HomePage(),
      ),
    );
  }
}
