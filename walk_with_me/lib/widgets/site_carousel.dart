// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walk_with_me/controllers/city_controller.dart';
import 'package:walk_with_me/controllers/data_controller.dart';
import 'package:walk_with_me/controllers/location_controller.dart';
import 'package:walk_with_me/models/site.dart';
import 'package:walk_with_me/widgets/site_item.dart';

class SiteCarousel extends StatelessWidget {
  final double viewFraction;
  final String cityToshowSites;
  const SiteCarousel({
    Key? key,
    required this.viewFraction,
    required this.cityToshowSites,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CityController cityController = Get.find<CityController>();
    LocationController locationController = Get.find<LocationController>();
    DataController dataController = Get.find<DataController>();
    return FutureBuilder<List<Site>>(
      builder: (_, AsyncSnapshot<List<Site>> sites) {
        if (sites.hasData) {
          if (sites.data!.isNotEmpty) {
            return ListView.builder(
              itemCount: sites.data!.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return SiteItem(site: sites.data![index]);
              },
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("No sites found for the city of " + cityToshowSites),
            );
          }
        }
        return const Center(child: CircularProgressIndicator());
      },
      future: dataController.getSitesByCity(cityToshowSites),
    );
  }
}
