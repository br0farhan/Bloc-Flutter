import 'package:bloc_flutter/features/alquran/pages/splash_page.dart';
import 'package:bloc_flutter/features/basic/Bloc%20Provider/bloc/counter_provider.dart';
import 'package:bloc_flutter/features/basic/basic_pages.dart';
import 'package:bloc_flutter/home/comingsoon.dart';
import 'package:bloc_flutter/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static const String home = '/';
  static const String basic = '/basic';
  static const String comingSoon = '/comingSoon';
  static const String splash = '/splash';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());

      case basic:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => CounterProviderBloc(),
            child: const BasicPages(),
          ),
        );

      case comingSoon:
        final category = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => Comingsoon(category: category),
        );

      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
