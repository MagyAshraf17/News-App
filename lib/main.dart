import 'package:flutter/material.dart';
import 'package:news_app/core/cofigrations/page_route_name.dart';
import 'package:news_app/core/cofigrations/route_generator.dart';

import 'core/cofigrations/app_theme_maneger.dart';
import 'features/home/pages/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: AppThemeManager.lightTheme,
      initialRoute: PageRouteName.initialPage,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
    );
  }
}
