// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:walk_with_me/controllers/location_controller.dart';

class MapViewScreen extends StatelessWidget {
  const MapViewScreen({Key? key}) : super(key: key);

  FilterChip getFilterChip(
      LocationController locationController, String apiValue, String text) {
    return FilterChip(
      label: Text(text),
      onSelected: (val) {
        locationController.toggleSearchPlacetype(apiValue, val);
      },
      selected: locationController.searchPlacetype.value == apiValue,
      selectedColor: Colors.blue,
    );
  }

  @override
  Widget build(BuildContext context) {
    late GoogleMapController _controller;
    LocationController locationController = Get.find<LocationController>();

    return SafeArea(
      child: ListView(
        children: [
          SizedBox(
            height: 400,
            child: Obx(
              () => locationController.latval.value == 0
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(
                      children: [
                        GoogleMap(
                          zoomGesturesEnabled: true,
                          zoomControlsEnabled: false,
                          mapType: MapType.normal,
                          myLocationButtonEnabled: true,
                          markers:
                              Set<Marker>.of(locationController.allMarkers),
                          initialCameraPosition: CameraPosition(
                            target: LatLng(locationController.latval.value,
                                locationController.lngval.value),
                            zoom: 14,
                          ),
                          onMapCreated: (GoogleMapController gmcontroller) {
                            _controller = gmcontroller;
                            debugPrint("Map is created!");
                            locationController.mapController = _controller;
                          },
                        ),
                        IconButton(
                          onPressed: () {
                            _controller.animateCamera(
                                CameraUpdate.newCameraPosition(CameraPosition(
                              target: LatLng(locationController.latval.value,
                                  locationController.lngval.value),
                              zoom: 14,
                            )));
                          },
                          icon: const Icon(Icons.center_focus_strong),
                        ),
                      ],
                    ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Find Nearest',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 8.0,
                children: [
                  getFilterChip(locationController, 'museum', 'Museum'),
                  getFilterChip(
                      locationController, 'art_gallery', 'Art Gallery'),
                  getFilterChip(locationController, 'zoo', 'Zoo'),
                  getFilterChip(locationController, 'tourist_attraction',
                      'Tourist Attraction'),
                  getFilterChip(locationController, 'aquarium', 'Aquarium'),
                  getFilterChip(
                      locationController, 'amusement_park', 'Amusement Park'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
