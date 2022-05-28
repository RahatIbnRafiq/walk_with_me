import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walk_with_me/globals/globals.dart';
import 'package:walk_with_me/screens/signin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: themeData,
      home: const Signin(),
    );
  }
}
