import 'package:flutter/material.dart';

import 'colors.dart';

class AppThemeManager {
  static ThemeData lightTheme = ThemeData(
    primaryColor: ColorPalette.primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorPalette.primaryColor,
      titleTextStyle: const TextStyle(
        fontFamily: "Exo",
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(30),
        bottomLeft: Radius.circular(30),
      )),
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 35,
      ),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: "Exo",
        fontWeight: FontWeight.bold,
        color: Colors.black87,
        fontSize: 25,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Exo",
        fontWeight: FontWeight.w500,
        color: Colors.black87,
        fontSize: 30,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Exo",
        fontWeight: FontWeight.w400,
        color: Colors.black87,
        fontSize: 25,
      ),
      bodySmall: TextStyle(
        fontFamily: "Exo",
        fontWeight: FontWeight.w400,
        color: Colors.black87,
        fontSize: 20,
      ),
      displaySmall: TextStyle(
        fontFamily: "Exo",
        fontWeight: FontWeight.w400,
        color: Colors.black87,
        fontSize: 16,
      ),
    ),
  );
}
