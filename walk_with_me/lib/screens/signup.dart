// ignore_for_file: unnecessary_new

// import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walk_with_me/controllers/auth_controller.dart';
import 'package:walk_with_me/controllers/signup_controller.dart';
import 'package:walk_with_me/globals/constants.dart';
import 'package:walk_with_me/widgets/image_carousel.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size.height;
    var wi = MediaQuery.of(context).size.width;
    SignupController signupController = Get.find<SignupController>();
    Color backgroundColor = Constants.primaryThemeData.backgroundColor;
    return Scaffold(
      body: Stack(
        children: [
          ImageCarousel(
            height: he,
            viewFraction: 1.0,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: he * 0.03,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 40.0,
                  ),
                  child: Text(
                    'create_account'.tr,
                    style: Theme.of(context).textTheme.headline2,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 40.0,
                  ),
                  child: Text(
                    'fill_in_info'.tr,
                    style: Theme.of(context).textTheme.bodyText2,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: he * 0.02,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 5.0,
                  ),
                  width: wi * 0.9,
                  height: he * 0.071,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: backgroundColor,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: Theme.of(context).textTheme.headline4,
                    controller: signupController.emailController,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.email),
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      hintStyle:
                          Theme.of(context).inputDecorationTheme.hintStyle,
                      hintText: 'email'.tr,
                    ),
                  ),
                ),
                SizedBox(
                  height: he * 0.02,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 5.0,
                  ),
                  width: wi * 0.9,
                  height: he * 0.071,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: backgroundColor,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: true,
                    style: Theme.of(context).textTheme.headline4,
                    controller: signupController.passwordController,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.lock_open_outlined),
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      hintStyle:
                          Theme.of(context).inputDecorationTheme.hintStyle,
                      hintText: 'password'.tr,
                    ),
                  ),
                ),
                SizedBox(
                  height: he * 0.02,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 5.0,
                  ),
                  width: wi * 0.9,
                  height: he * 0.071,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: backgroundColor,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: true,
                    style: Theme.of(context).textTheme.headline4,
                    controller: signupController.confirmPasswordController,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.lock_open_outlined),
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      hintStyle:
                          Theme.of(context).inputDecorationTheme.hintStyle,
                      hintText: 'confirm_password'.tr,
                    ),
                  ),
                ),
                SizedBox(
                  height: he * 0.02,
                ),
                TextButton(
                  onPressed: () {
                    if (signupController.validate()) {
                      AuthController.instance.register(
                          signupController.emailController.text.trim(),
                          signupController.passwordController.text.trim());
                    }
                  },
                  child: Text(
                    'sign_up'.tr,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF0DF5E4).withOpacity(0.7),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 80),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                SizedBox(height: he * 0.13),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'account_already'.tr,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    SizedBox(width: wi * 0.01),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/signin');
                      },
                      child: Text(
                        'sign_in'.tr,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
