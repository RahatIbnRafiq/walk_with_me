// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:walk_with_me/models/city.dart';

class CityCarousel extends StatefulWidget {
  const CityCarousel({Key? key}) : super(key: key);

  @override
  State<CityCarousel> createState() => _CityCarouselState();
}

class _CityCarouselState extends State<CityCarousel>
    with TickerProviderStateMixin {
  Widget returnCityList(cityList) {
    return SizedBox(
      height: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cityList.length,
        itemBuilder: (context, index) {
          City city = cityList[index];
          return GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(10.0),
              width: 210.0,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    bottom: 15.0,
                    child: Container(
                      height: 120.0,
                      width: 200.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              city.description,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
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
                        )
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
          tabs: const [
            Tab(text: "Downloaded"),
            Tab(text: "Most popular"),
            Tab(text: "See All"),
          ],
        ),
        SizedBox(
          height: 300,
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
