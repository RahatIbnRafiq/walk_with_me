import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walk_with_me/screens/signin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Walk With Me',
      theme: ThemeData(
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
      ),
      home: const Signin(),
    );
  }
}
