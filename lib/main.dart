import 'package:bloc_flutter/app.dart';
import 'package:bloc_flutter/bloc/counter.dart';
import 'package:bloc_flutter/bloc/theme.dart';
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
   return MultiBlocProvider(providers: [
    BlocProvider(create: 
    (context) => CounterBloc(),
    ),
     BlocProvider(create: 
    (context) => ThemeBloc(),
    ),
   ], child: App()
    );
  }
}
