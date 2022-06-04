import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walk_with_me/globals/constants.dart';
import 'package:walk_with_me/globals/messages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Messages(),
      locale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      title: 'apptitle'.tr,
      theme: Constants.primaryThemeData,
      home: Scaffold(
        appBar: AppBar(
          title: Text('apptitle'.tr),
        ),
        body: const Text('Hello there User!'),
      ),
    );
  }
}
