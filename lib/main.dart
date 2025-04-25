
import 'package:bloc_flutter/features/basic/Bloc%20Provider/bloc/counter_provider.dart';
import 'package:bloc_flutter/features/basic/Depedecny%20Injection/bloc/counter_depedency_bloc.dart';
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
        home: MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(create: (context) =>
         CounterBloc()
        ),
           BlocProvider<CounterProvider>(create: (context) =>
         CounterProvider()
        ),
        BlocProvider<CounterDepedencyBloc>(create: (context) =>
         CounterDepedencyBloc()
        ),
      ],
      child: HomePage(),
    ));
  }
}
