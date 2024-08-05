import 'package:bloc_flutter/404/notfound.dart';
import 'package:bloc_flutter/bloc/counter.dart';
import 'package:bloc_flutter/pages/home.dart';
import 'package:bloc_flutter/pages/other.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class appRouter {
  final Counter myCounter = Counter();
  Route onRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/home":
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: myCounter,
                  child: const HomePage(),
                ));
      case "otherPages":
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: myCounter,
                  child: const OtherPages(),
                ));
      default:
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: myCounter,
                  child: const NotFound(),
                ));
    }
  }
}
