// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walk_with_me/controllers/city_controller.dart';
import 'package:walk_with_me/controllers/location_controller.dart';
import 'package:walk_with_me/models/city.dart';

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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          city.city,
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 40,
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
