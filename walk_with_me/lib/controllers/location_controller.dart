// ignore_for_file: unused_local_variable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:walk_with_me/controllers/city_controller.dart';
import 'package:walk_with_me/models/place.dart';
import 'package:http/http.dart' as http;
// import 'package:walk_with_me/models/place.dart';
import 'dart:convert' as convert;

// import 'package:walk_with_me/models/place_search.dart';

class LocationController extends GetxController {
  var latitude = 'Getting Latitude..'.obs;
  var longitude = 'Getting Longitude..'.obs;
  RxDouble latval = 0.0.obs;
  RxDouble lngval = 0.0.obs;
  var address = 'Getting Address..'.obs;
  var locationEnabled = false.obs;
  var searchPlacetype = ''.obs;
  List<Marker> allMarkers = <Marker>[].obs;

  RxDouble southwestLat = 0.0.obs;
  RxDouble southwestLon = 0.0.obs;
  RxDouble northeastLat = 0.0.obs;
  RxDouble northeastLon = 0.0.obs;
  late GoogleMapController mapController;

  late StreamSubscription<Position> streamSubscription;
  final key = "AIzaSyBKZiNcCJx68Apl-1NS7p47HVqJOG68JCM";

  @override
  void onInit() async {
    super.onInit();
    getLocation();
  }

  @override
  void onClose() {
    streamSubscription.cancel();
  }

  getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    locationEnabled.value = true;

    streamSubscription =
        Geolocator.getPositionStream().listen((Position position) {
      latitude.value = 'Latitude : ${position.latitude}';
      longitude.value = 'Longitude : ${position.longitude}';
      latval.value = position.latitude;
      lngval.value = position.longitude;
      getAddressFromLatLang(position);
    });
  }

  Future<void> getAddressFromLatLang(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];
    address.value = '${place.locality}';
    Get.find<CityController>().changeCurrentCity(address.value);
  }

  Future<List<Place>> getPlaces(
      double lat, double lng, String placeType) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/textsearch/json?key=$key&type=$placeType&location=$lat,$lng&rankby=distance';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['results'] as List;
    return jsonResults.map((place) => Place.fromJson(place)).toList();
  }

  void toggleSearchPlacetype(String value, bool selected) async {
    if (selected) {
      searchPlacetype.value = value;
    } else {
      searchPlacetype.value = '';
    }

    if (searchPlacetype.value.isNotEmpty) {
      var searchPlaces =
          await getPlaces(latval.value, lngval.value, searchPlacetype.value);
      debugPrint("Total places returned: " + searchPlaces.length.toString());
      allMarkers.clear();
      debugPrint("After clearing Total Markers: ${allMarkers.length} ");
      for (var place in searchPlaces) {
        //debugPrint("place: " + place.name);
        allMarkers.add(createMArkerFromPlace(place));
      }
      debugPrint("Total Markers: ${allMarkers.length} ");
      getBounds(allMarkers.toSet());
      var bounds = LatLngBounds(
          southwest: LatLng(southwestLat.value, southwestLon.value),
          northeast: LatLng(northeastLat.value, northeastLon.value));
      debugPrint("Got new bounds..");
      debugPrint(
          "${southwestLat.value} , ${southwestLon.value}, ${northeastLat.value}, ${northeastLon.value}");
      mapController.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
    }
  }

  void getBounds(Set<Marker> markers) {
    if (markers.isEmpty) return;
    createBounds(markers.map((m) => m.position).toList());
  }

  void createBounds(List<LatLng> positions) {
    southwestLat.value = positions.map((p) => p.latitude).reduce(
        (value, element) => value < element ? value : element); // smallest
    southwestLon.value = positions
        .map((p) => p.longitude)
        .reduce((value, element) => value < element ? value : element);
    northeastLat.value = positions.map((p) => p.latitude).reduce(
        (value, element) => value > element ? value : element); // biggest
    northeastLon.value = positions
        .map((p) => p.longitude)
        .reduce((value, element) => value > element ? value : element);
  }

  Marker createMArkerFromPlace(Place place) {
    var markerId = MarkerId(place.name);

    return Marker(
      markerId: markerId,
      draggable: false,
      position: LatLng(
        place.geometry.placeSearchLocation.lat,
        place.geometry.placeSearchLocation.lng,
      ),
      infoWindow: InfoWindow(
        title: place.name,
        snippet: place.address,
      ),
    );
  }
}
