import 'package:flutter/material.dart';
import 'package:news_app/features/home/pages/home_screen.dart';
import 'package:news_app/features/splash/splash_screen.dart';

import 'page_route_name.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.initialPage:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
          settings: settings,
        );
      case PageRouteName.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
          settings: settings,
        );
    }
  }
}
