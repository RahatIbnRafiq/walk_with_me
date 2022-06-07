import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:walk_with_me/globals/constants.dart';

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
      items: Constants.backgroundCityImages.map<Widget>((imagesName) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.dstATop),
                  image:
                      AssetImage(Constants.carouselImagesAddress + imagesName),
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
