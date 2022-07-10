class PlaceSearchLocation {
  final double lat;
  final double lng;

  PlaceSearchLocation({
    required this.lat,
    required this.lng,
  });

  factory PlaceSearchLocation.fromJson(Map<dynamic, dynamic> parsedJson) {
    return PlaceSearchLocation(
      lat: parsedJson["lat"],
      lng: parsedJson["lng"],
    );
  }
}
