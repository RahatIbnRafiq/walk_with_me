// import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:walk_with_me/models/site.dart';
// import 'package:walk_with_me/services/backend_service.dart';

class CityController extends GetxController {
  var initialCity = "Rome".obs;
  var currentCity = "".obs;
  var selectedCity = "".obs;
  var locationEnabled = false.obs;
  var suggestedCitySelected = false.obs;
  var cityToshowSites = "".obs;

  void changeSelectedCity() {
    if (suggestedCitySelected.value == true) {
      cityToshowSites.value = selectedCity.value;
    } else if (locationEnabled.value == true) {
      cityToshowSites.value = currentCity.value;
    } else {
      cityToshowSites.value = initialCity.value;
    }
  }

  void changeCurrentCity(String city) {
    locationEnabled.value = true;
    currentCity.value = city;
    changeSelectedCity();
  }

  Future<void> changeSuggestedCity(String city) async {
    selectedCity.value = city;
    suggestedCitySelected.value = true;
    changeSelectedCity();
  }
}
