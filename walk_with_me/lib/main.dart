import 'package:flutter/material.dart';
import 'package:walk_with_me/screens/signin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Walk With Me',
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue[800],

        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
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
