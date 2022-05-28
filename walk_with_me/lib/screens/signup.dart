import 'package:flutter/material.dart';
import 'package:walk_with_me/screens/signin.dart';

import '../animation/fadeanimation.dart';
import '../widgets/image_carousel.dart';

enum RegistrationInformation {
  username,
  email,
  password,
  confirmpassword,
}

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  Color enabled = const Color(0xFF827F8A);
  Color enabledtxt = Colors.white;
  Color deaible = Colors.grey;
  Color backgroundColor = const Color(0xFF1F1A30);
  bool ispasswordev = true;
  RegistrationInformation? selected;

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: const Color(0xFF1F1A30),
      body: Stack(
        children: [
          ImageCarousel(
            height: he,
            viewFraction: 1.0,
          ),
          SingleChildScrollView(
            child: SizedBox(
              width: we,
              height: he,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: he * 0.03,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      right: 40.0,
                      top: 40.0,
                    ),
                    child: Text(
                      "Create Your Account",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      right: 130.0,
                      top: 40.0,
                    ),
                    child: Text(
                      "Fill in the information below",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  SizedBox(
                    height: he * 0.02,
                  ),
                  Container(
                    width: we * 0.9,
                    height: he * 0.071,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: selected == RegistrationInformation.email
                          ? enabled
                          : backgroundColor,
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onTap: () {
                        setState(() {
                          selected = RegistrationInformation.email;
                        });
                      },
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: selected == RegistrationInformation.email
                              ? enabledtxt
                              : deaible,
                        ),
                        hintText: 'Email',
                        hintStyle: Theme.of(context).textTheme.headline4,
                      ),
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  SizedBox(
                    height: he * 0.02,
                  ),
                  Container(
                    width: we * 0.9,
                    height: he * 0.071,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: selected == RegistrationInformation.password
                            ? enabled
                            : backgroundColor),
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onTap: () {
                        setState(() {
                          selected = RegistrationInformation.password;
                        });
                      },
                      decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.lock_open_outlined,
                            color: selected == RegistrationInformation.password
                                ? enabledtxt
                                : deaible,
                          ),
                          suffixIcon: IconButton(
                            icon: ispasswordev
                                ? Icon(
                                    Icons.visibility_off,
                                    color: selected ==
                                            RegistrationInformation.password
                                        ? enabledtxt
                                        : deaible,
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color: selected ==
                                            RegistrationInformation.password
                                        ? enabledtxt
                                        : deaible,
                                  ),
                            onPressed: () =>
                                setState(() => ispasswordev = !ispasswordev),
                          ),
                          hintText: 'Password',
                          hintStyle: Theme.of(context).textTheme.headline4),
                      obscureText: ispasswordev,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  SizedBox(
                    height: he * 0.02,
                  ),
                  Container(
                    width: we * 0.9,
                    height: he * 0.071,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color:
                            selected == RegistrationInformation.confirmpassword
                                ? enabled
                                : backgroundColor),
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onTap: () {
                        setState(() {
                          selected = RegistrationInformation.confirmpassword;
                        });
                      },
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.lock_open_outlined,
                          color: selected ==
                                  RegistrationInformation.confirmpassword
                              ? enabledtxt
                              : deaible,
                        ),
                        suffixIcon: IconButton(
                          icon: ispasswordev
                              ? Icon(
                                  Icons.visibility_off,
                                  color: selected ==
                                          RegistrationInformation
                                              .confirmpassword
                                      ? enabledtxt
                                      : deaible,
                                )
                              : Icon(
                                  Icons.visibility,
                                  color: selected ==
                                          RegistrationInformation
                                              .confirmpassword
                                      ? enabledtxt
                                      : deaible,
                                ),
                          onPressed: () =>
                              setState(() => ispasswordev = !ispasswordev),
                        ),
                        hintText: 'Confirm Password',
                        hintStyle: Theme.of(context).textTheme.headline4,
                      ),
                      obscureText: ispasswordev,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  SizedBox(
                    height: he * 0.02,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Sign Up",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFF0DF5E4),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  SizedBox(height: he * 0.13),
                  FadeAnimation(
                    delay: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        SizedBox(width: we * 0.01),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              // go to login page
                              return const Signin();
                            }));
                          },
                          child: Text(
                            "Sign In",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
