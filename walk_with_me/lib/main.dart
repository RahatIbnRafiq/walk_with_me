import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walk_with_me/globals/constants.dart';
import 'package:walk_with_me/globals/messages.dart';
import 'package:walk_with_me/screens/home_screen.dart';

import 'bindings/homepage_bindings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp().then((value) => Get.put(AuthController()));
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
          // GetPage(
          //   name: '/signup',
          //   page: () => const Signup(),
          //   binding: SignupBindings(),
          // ),
          // GetPage(
          //   name: '/signin',
          //   page: () => const Signin(),
          //   binding: SigninBindings(),
          // ),
          GetPage(
            name: '/home',
            page: () => const HomeScreen(),
            binding: HomepageBindings(),
          ),
        ],
      ),
    );
  }
}
