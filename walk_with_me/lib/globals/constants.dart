import 'package:flutter/material.dart';

class Constants {
  static const List<String> backgroundCityImages = [
    "barcelona.jpeg",
    "dublin.jpeg",
    "istambul.jpeg",
    "london.jpeg",
    "munich.jpeg",
    "rome.jpeg",
    "paris.jpeg",
  ];
  static const String carouselImagesAddress = "assets/images/";
  static const int maxPasswordLength = 6;

  static ThemeData primaryThemeData = ThemeData(
    primaryColor: const Color(0xFF3EBACE),
    scaffoldBackgroundColor: const Color(0xFFF3F5F7),
    brightness: Brightness.light,
    fontFamily: 'Georgia',
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 35.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1F1A30),
      ),
      headline2: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1F1A30),
      ),
      headline3: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1F1A30),
      ),
      headline4: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyText1: TextStyle(
        fontSize: 16.0,
        color: Colors.purple,
      ),
      bodyText2: TextStyle(
        fontSize: 16.0,
        color: Color(0xFF1F1A30),
      ),
    ),
  );
}
