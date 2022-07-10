import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // UserAccountsDrawerHeader(
          //   currentAccountPicture: const CircleAvatar(
          //     backgroundImage: NetworkImage(
          //         'https://c8.alamy.com/comp/2F9MJ5P/line-drawing-of-a-male-person-sitting-on-chair-and-thinking-continuous-line-drawing-of-sitting-businessman-vector-illustration-free-single-line-draw-2F9MJ5P.jpg'),
          //   ),
          //   accountEmail: Text(
          //     AuthController.instance.userEmail,
          //     style: const TextStyle(fontSize: 20.0),
          //   ),
          //   accountName: null,
          //   decoration: BoxDecoration(
          //     color: Constants.primaryThemeData.scaffoldBackgroundColor,
          //   ),
          // ),
          ListTile(
            leading: const Icon(Icons.download_for_offline),
            title: const Text(
              'Downloaded Cities',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(
              'Settings',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {},
          ),
          const Divider(
            height: 10,
            thickness: 1,
          ),
          // ListTile(
          //   leading: const Icon(Icons.logout),
          //   title: const Text(
          //     'Sign Out',
          //     style: TextStyle(
          //       color: Colors.black,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          //   onTap: () {
          //     AuthController.instance.logOut();
          //   },
          // ),
        ],
      ),
    );
    // return Drawer(
    //   child: ListView(
    //     padding: EdgeInsets.zero,
    //     children: [
    //       DrawerHeader(
    //         decoration: const BoxDecoration(
    //           color: Colors.blue,
    //         ),
    //         child: Text('apptitle'.tr),
    //       ),
    //       ListTile(
    //         title: const Text('Downloaded Cities'),
    //         onTap: () {},
    //       ),
    //       ListTile(
    //         title: const Text('Settings'),
    //         onTap: () {},
    //       ),
    //       ListTile(
    //         title: const Text('Sign out'),
    //         onTap: () {
    //           AuthController.instance.logOut();
    //         },
    //       ),
    //     ],
    //   ),
    // );
  }
}
