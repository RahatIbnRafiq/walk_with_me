import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class City {
  String? name;
  String? imageUrl;
  dynamic location;
  List<dynamic>? sites;

  City({
    required this.name,
    required this.imageUrl,
    required this.location,
    required this.sites,
  });

  void printCity() {
    debugPrint("City name: " + name.toString());
    debugPrint("City image: " + imageUrl.toString());
    debugPrint("City location: " + location.toString());
    debugPrint("City sites: " + sites.toString());
  }

  City.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    name = documentSnapshot["name"];
    imageUrl = documentSnapshot["image"];
    location = documentSnapshot["location"];
    sites = documentSnapshot["sites"];
  }
}
