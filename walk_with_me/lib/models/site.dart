// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Site {
  String? name;
  String? city;
  String? description;
  dynamic location;
  List<dynamic>? tags;
  List<dynamic>? imageUrls;
  Uri audioSource = Uri.parse("");

  Site({
    required this.name,
    required this.city,
    required this.imageUrls,
    required this.location,
    required this.description,
    required this.tags,
  });

  void printSite() {
    debugPrint("Site name: " + name.toString());
    debugPrint("Site city: " + city.toString());
  }

  factory Site.fromJson(Map<String, dynamic> json) {
    // debugPrint("Converting from json to Site Data.......");
    // debugPrint("Whole json: " + json.toString());
    // debugPrint("json[\"name\"]" + json["name"]);
    // debugPrint("json[\"city\"]" + json["city"]);
    // debugPrint("json[\"description\"]" + json["description"]);
    // debugPrint("json[\"audioSource\"]" + json["audioSource"]);
    // debugPrint("json[\"imageUrls\"]" + json["imageUrls"].toString());
    // debugPrint("json[\"tags\"]" + json["tags"].toString());

    var tagsFromJson =
        List<dynamic>.from(json['tags']).map((i) => i.toString()).toList();
    // debugPrint("tagsFromJson: " + tagsFromJson.toString());
    var imageURlsFromJson =
        List<dynamic>.from(json['imageUrls']).map((i) => i.toString()).toList();
    // debugPrint("imageURlsFromJson: " + imageURlsFromJson.toString());

    var site = Site(
      name: json['name'],
      city: json['city'],
      imageUrls: imageURlsFromJson,
      location: json['location'],
      description: json['description'],
      tags: tagsFromJson,
    );
    //site.audioSource = json['audioSource'];
    site.audioSource = Uri.parse(json['audioSource']);
    return site;
  }

  Map<String, dynamic> toJson() {
    // debugPrint("converting site to json ");
    var siteToJson = {
      'name': name.toString(),
      'city': city.toString(),
      'description': description.toString(),
      'location': location.toString(),
      'audioSource': audioSource.toString(),
      'tags': tags!.map((item) => item).toList(),
      'imageUrls': imageUrls!.map((item) => item).toList(),
    };
    //debugPrint("siteToJson: " + siteToJson.toString());
    return siteToJson;
  }

  Site.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    name = documentSnapshot["name"];
    imageUrls = documentSnapshot["images"];
    description = documentSnapshot["description"];
    city = documentSnapshot["city"];
    location = documentSnapshot["location"];
    tags = documentSnapshot["tags"];
  }
}
