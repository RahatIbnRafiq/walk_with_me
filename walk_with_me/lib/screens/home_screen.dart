import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walk_with_me/widgets/app_drawer.dart';
import 'package:walk_with_me/widgets/city_carousel.dart';
import 'package:walk_with_me/widgets/search_suggestion.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('apptitle'.tr)),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            vertical: 30.0,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 100.0),
              child: Text(
                'discover'.tr,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const SearchSuggestion(),
            const SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 10.0),
              child: Text(
                'download_a_city'.tr,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const CityCarousel(),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
