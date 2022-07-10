import 'package:walk_with_me/models/place_search_location.dart';

class Geometry {
  final PlaceSearchLocation placeSearchLocation;

  Geometry({required this.placeSearchLocation});

  factory Geometry.fromJson(Map<dynamic, dynamic> parsedJson) {
    return Geometry(
        placeSearchLocation:
            PlaceSearchLocation.fromJson(parsedJson['location']));
  }
}
