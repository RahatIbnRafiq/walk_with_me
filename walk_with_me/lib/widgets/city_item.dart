// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walk_with_me/controllers/city_controller.dart';
import 'package:walk_with_me/controllers/location_controller.dart';
import 'package:walk_with_me/models/city.dart';

class CityItem extends StatelessWidget {
  const CityItem({
    Key? key,
    required this.city,
  }) : super(key: key);

  final City city;

  @override
  Widget build(BuildContext context) {
    CityController cityController = Get.find<CityController>();
    LocationController locationController = Get.find<LocationController>();
    return GestureDetector(
      onTap: () {
        cityController.changeSuggestedCity(city.city.toString());
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: const EdgeInsets.all(10.0),
        width: 180.0,
        child: Stack(
          children: [
            Hero(
              tag: 'city_' + city.imageUrl,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image(
                  height: 180.0,
                  width: 180.0,
                  image: AssetImage(city.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 10.0,
              left: 10.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    city.city,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(
                    Icons.download_for_offline,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
