// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walk_with_me/controllers/city_controller.dart';
import 'package:walk_with_me/controllers/location_controller.dart';
import 'package:walk_with_me/models/city.dart';
import 'package:walk_with_me/widgets/city_item.dart';

class CityCarousel extends StatefulWidget {
  const CityCarousel({Key? key}) : super(key: key);

  @override
  State<CityCarousel> createState() => _CityCarouselState();
}

class _CityCarouselState extends State<CityCarousel>
    with TickerProviderStateMixin {
  CityController cityController = Get.find<CityController>();
  LocationController locationController = Get.find<LocationController>();
  Widget returnCityList(cityList) {
    return SizedBox(
      //height: 150.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cityList.length,
        itemBuilder: (context, index) {
          City city = cityList[index];
          return CityItem(city: city);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabcontroller = TabController(length: 3, vsync: this);
    return Column(
      children: [
        TabBar(
          controller: _tabcontroller,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: [
            Tab(text: 'downloaded_cities'.tr),
            Tab(text: 'top_cities'.tr),
            Tab(text: 'see_all'.tr),
          ],
        ),
        SizedBox(
          height: 180,
          width: double.maxFinite,
          child: TabBarView(controller: _tabcontroller, children: [
            returnCityList(City.getDownloaded()),
            returnCityList(City.getMostPopular()),
            returnCityList(City.getAll()),
          ]),
        ),
      ],
    );
  }
}
