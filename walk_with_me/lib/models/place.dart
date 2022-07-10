import 'package:walk_with_me/models/geometry.dart';

class Place {
  final Geometry geometry;
  final String name;
  final String placeId;
  final String address;

  Place({
    required this.geometry,
    required this.name,
    required this.placeId,
    required this.address,
  });

  factory Place.fromJson(Map<String, dynamic> parsedJson) {
    return Place(
      geometry: Geometry.fromJson(parsedJson['geometry']),
      name: parsedJson['name'],
      placeId: parsedJson['place_id'],
      address: parsedJson['formatted_address'],
    );
  }
}
