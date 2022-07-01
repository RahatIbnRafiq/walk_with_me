// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:walk_with_me/globals/constants.dart';
import 'package:walk_with_me/models/site.dart';

class SiteDetailsScreen extends StatelessWidget {
  const SiteDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic argumentData = Get.arguments;
    Site site = argumentData['site'];
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Site Details",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Constants.primaryThemeData.scaffoldBackgroundColor,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
            child: Column(
              children: [
                Container(
                  height: 250.0,
                  color: Constants.primaryThemeData.scaffoldBackgroundColor,
                  child: Stack(
                    children: [
                      Hero(
                        tag: 'site_' + site.name!,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40.0),
                          child: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.5),
                                BlendMode.dstATop),
                            child: Image(
                              height: double.infinity,
                              width: double.infinity,
                              image: NetworkImage(site.imageUrls![0]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20.0,
                        right: 20.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            site.name!,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 40.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          "Description",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: const Icon(
                            Icons.directions,
                            color: Colors.black54,
                          ),
                          iconSize: 60,
                          alignment: Alignment.center,
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: const Icon(
                            Icons.play_circle_filled,
                            color: Colors.black54,
                          ),
                          iconSize: 60,
                          alignment: Alignment.center,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 20.0,
                  child: Text(
                    "Tags: " + site.tags!.join(","),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ReadMoreText(
                  site.description!,
                  trimLines: 5,
                  colorClickableText: Color.fromARGB(255, 24, 2, 9),
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  moreStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
