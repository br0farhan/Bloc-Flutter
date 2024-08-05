import 'package:bloc_flutter/bloc/counter.dart';

import 'package:bloc_flutter/routes/routes.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final router = appRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: router.onRoute ,
    );
  }
}
