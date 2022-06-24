// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walk_with_me/controllers/city_controller.dart';
import 'package:walk_with_me/controllers/location_controller.dart';
import 'package:walk_with_me/widgets/city_carousel.dart';
import 'package:walk_with_me/widgets/search_suggestion.dart';
import 'package:walk_with_me/widgets/site_carousel.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CityController cityController = Get.find<CityController>();
    LocationController locationController = Get.find<LocationController>();
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                child: Obx(
                  () => Text(
                    cityController.currentCity.value.toString(),
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),
          const SearchSuggestion(),
          const SizedBox(
            height: 20.0,
          ),
          const CityCarousel(),
          const SizedBox(
            height: 40.0,
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 10.0),
              child: Text(
                'Sites for ' + cityController.cityToshowSites.value,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Obx(
            () => SiteCarousel(
              viewFraction: 0.8,
              cityToshowSites: cityController.cityToshowSites.value,
            ),
          ),
        ],
      ),
    );
  }
}
