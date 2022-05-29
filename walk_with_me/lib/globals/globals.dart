// ignore: non_constant_identifier_names
// ignore_for_file: non_constant_identifier_names, duplicate_ignore, unnecessary_const

import 'package:flutter/material.dart';

final List<String> BACKGROUND_CITY_IMAGES = [
  "barcelona.jpg",
  "dublin.jpg",
  "istambul.jpg",
  "london.jpg",
  "munich.jpg",
  "rome.jpg",
  "paris.jpg",
];

// ignore: constant_identifier_names
const String CAROUSEL_IMAGES_ADDRESS = "assets/images/";

final ThemeData themeData = ThemeData(
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
