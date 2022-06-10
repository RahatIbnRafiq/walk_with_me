import 'package:flutter/material.dart';
import 'package:walk_with_me/controllers/auth_controller.dart';

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

  static AppBar getCustomAppBar(GlobalKey<ScaffoldState> scaffoldKey) {
    return AppBar(
      backgroundColor: primaryThemeData.scaffoldBackgroundColor,
      elevation: 0.0,
      leading: IconButton(
        icon:
            const Icon(Icons.menu, color: Colors.black), // set your color here
        onPressed: () {
          scaffoldKey.currentState!.openDrawer();
        },
      ),
      actions: <Widget>[
        PopupMenuButton<int>(
          icon: const Icon(
            Icons.person,
            color: Colors.black,
          ),
          onSelected: (item) {
            popUpMenuNavigations(item);
          },
          itemBuilder: (context) => [
            const PopupMenuItem<int>(value: 1, child: Text('Settings')),
            const PopupMenuItem<int>(value: 0, child: Text('Sign Out')),
          ],
        ),
      ],
    );
  }

  static void popUpMenuNavigations(int item) {
    switch (item) {
      case 0:
        AuthController.instance.logOut();
        break;
      case 1:
        break;
    }
  }

  static ThemeData primaryThemeData = ThemeData(
    primaryIconTheme: const IconThemeData(color: Colors.black),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.white),
      hintStyle: TextStyle(color: Colors.grey),
      enabledBorder: InputBorder.none,
      border: InputBorder.none,
    ),
    primaryColor: const Color(0xFF3EBACE),
    scaffoldBackgroundColor: const Color(0xFFF3F5F7),
    backgroundColor: const Color.fromARGB(255, 14, 3, 52),
    brightness: Brightness.light,
    fontFamily: 'Georgia',
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 35.0,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 14, 3, 52),
      ),
      headline2: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 14, 3, 52),
      ),
      headline3: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 14, 3, 52),
      ),
      headline4: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headline5: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 14, 3, 52),
      ),
      bodyText1: TextStyle(
        fontSize: 16.0,
        color: Colors.purple,
      ),
      bodyText2: TextStyle(
        fontSize: 16.0,
        color: Color.fromARGB(255, 14, 3, 52),
      ),
    ),
  );
}
