import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore_for_file: unused_local_variable
import 'package:walk_with_me/controllers/location_controller.dart';
import 'package:walk_with_me/widgets/entity_carousel.dart';
import 'package:walk_with_me/widgets/search_suggestion.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    locationController.address.value,
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
          // const SizedBox(
          //   height: 40.0,
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 20.0, right: 10.0),
          //   child: Text(
          //     'browse_cities'.tr,
          //     style: const TextStyle(
          //       fontSize: 25,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
          // const SizedBox(
          //   height: 20.0,
          // ),
          //const CityCarousel(),
          // const SizedBox(
          //   height: 20.0,
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 20.0, right: 10.0),
          //   child: Text(
          //     'explore_entities'.tr,
          //     style: const TextStyle(
          //       fontSize: 30,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: 20.0,
          ),
          // Obx(
          //   () => Text(
          //     locationController.address.value,
          //     style: const TextStyle(
          //       color: Colors.black,
          //       fontSize: 25,
          //     ),
          //   ),
          // ),

          const EntityCarousel(),
        ],
      ),
    );
  }
}
