import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walk_with_me/controllers/auth_controller.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('apptitle'.tr),
          ),
          ListTile(
            title: const Text('Downloaded Cities'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Sign out'),
            onTap: () {
              AuthController.instance.logOut();
            },
          ),
        ],
      ),
    );
  }
}
