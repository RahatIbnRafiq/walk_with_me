import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walk_with_me/bindings/signin_bindings.dart';
import 'package:walk_with_me/bindings/signup_bindings.dart';
import 'package:walk_with_me/controllers/auth_controller.dart';
import 'package:walk_with_me/globals/constants.dart';
import 'package:walk_with_me/globals/messages.dart';
import 'package:walk_with_me/screens/signin.dart';
import 'package:walk_with_me/screens/signup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
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
      initialRoute: '/signin',
      getPages: [
        GetPage(
          name: '/signup',
          page: () => const Signup(),
          binding: SignupBindings(),
        ),
        GetPage(
          name: '/signin',
          page: () => const Signin(),
          binding: SigninBindings(),
        ),
      ],
    );
  }
}
