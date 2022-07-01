import 'dart:io';

import 'package:feedback/feedback.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:walk_with_me/controllers/data_controller.dart';
import 'package:walk_with_me/controllers/media_player_controller.dart';
import 'package:walk_with_me/globals/constants.dart';
import 'package:walk_with_me/globals/messages.dart';
import 'package:walk_with_me/screens/home_screen.dart';
import 'package:walk_with_me/screens/site_details_screen.dart';

import 'bindings/homepage_bindings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  //await Firebase.initializeApp();

  await Firebase.initializeApp().then((value) {
    Get.put(DataController());
  });
  await GetStorage.init();
  sleep(const Duration(seconds: 3));
  Get.put(MediaPlayerController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BetterFeedback(
      child: GetMaterialApp(
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
        initialRoute: '/home',
        getPages: [
          GetPage(
            name: '/home',
            page: () => const HomeScreen(),
            binding: HomepageBindings(),
          ),
          GetPage(
            name: '/sitedetails',
            page: () => const SiteDetailsScreen(),
            //binding: HomepageBindings(),
          ),
          // GetPage(
          //   name: '/mediaplayer',
          //   page: () => const MediaPlayerScreen(),
          //   binding: HomepageBindings(),
          // ),
        ],
      ),
    );
  }
}
