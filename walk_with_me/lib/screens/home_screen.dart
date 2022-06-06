import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'apptitle'.tr,
      home: Scaffold(
        appBar: AppBar(
          title: Text('apptitle'.tr),
        ),
        body: const Center(
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.lightBlueAccent),
            child: Text('Dashboard!'),
          ),
        ),
      ),
    );
  }
}
