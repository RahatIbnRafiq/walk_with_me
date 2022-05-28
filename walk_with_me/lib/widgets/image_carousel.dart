// ignore_for_file: unnecessary_new

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:walk_with_me/globals/globals.dart';

class ImageCarousel extends StatelessWidget {
  final double height;
  final double viewFraction;
  const ImageCarousel({
    Key? key,
    required this.height,
    required this.viewFraction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: BACKGROUND_CITY_IMAGES.map<Widget>((imagesName) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.dstATop),
                  image: AssetImage('assets/images/' + imagesName),
                ),
              ),
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        height: height,
        viewportFraction: viewFraction,
        autoPlay: true,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
      ),
    );
  }
}
