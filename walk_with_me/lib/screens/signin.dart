// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:walk_with_me/screens/signup.dart';

import '../animation/fadeanimation.dart';

enum SignInInformation {
  email,
  password,
}

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  Color enabled = const Color(0xFF827F8A);
  Color enabledtxt = Colors.white;
  Color deaible = Colors.grey;
  Color backgroundColor = const Color(0xFF1F1A30);
  bool ispasswordev = true;
  SignInInformation? selected;

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.4), BlendMode.dstATop),
                image: const AssetImage('assets/images/barcelona.jpg'),
              ),
            ),
            // decoration: const BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage('assets/images/barcelona.jpg'),
            //     fit: BoxFit.fitHeight,
            //   ),
            // ),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: he * 0.03,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 40.0,
                  ),
                  child: Text(
                    "Welcome!",
                    style: Theme.of(context).textTheme.headline2,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 40.0,
                  ),
                  child: Text(
                    "Please enter your login informaion",
                    style: Theme.of(context).textTheme.bodyText2,
                    textAlign: TextAlign.center,
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
                    color: selected == SignInInformation.email
                        ? enabled
                        : backgroundColor,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onTap: () {
                      setState(() {
                        selected = SignInInformation.email;
                      });
                    },
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: selected == SignInInformation.email
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
                      color: selected == SignInInformation.password
                          ? enabled
                          : backgroundColor),
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onTap: () {
                      setState(() {
                        selected = SignInInformation.password;
                      });
                    },
                    decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.lock_open_outlined,
                          color: selected == SignInInformation.password
                              ? enabledtxt
                              : deaible,
                        ),
                        suffixIcon: IconButton(
                          icon: ispasswordev
                              ? Icon(
                                  Icons.visibility_off,
                                  color: selected == SignInInformation.password
                                      ? enabledtxt
                                      : deaible,
                                )
                              : Icon(
                                  Icons.visibility,
                                  color: selected == SignInInformation.password
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
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Sign In",
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
                        "Don't have an account yet?",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      SizedBox(width: we * 0.01),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            // go to login page
                            return const Signup();
                          }));
                        },
                        child: Text(
                          "Sign Up",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ],
                  ),
                ),
                // const SizedBox(height: 10),
                // const Image(
                //   image: AssetImage(
                //     'assets/images/barcelona.jpg',
                //   ),
                // ),
                // Container(
                //   decoration: const BoxDecoration(
                //     image: DecorationImage(
                //         image: AssetImage('assets/images/barcelona.jpg'),
                //         fit: BoxFit.fitHeight),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
