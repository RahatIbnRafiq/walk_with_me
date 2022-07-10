import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:walk_with_me/controllers/city_controller.dart';
import 'package:walk_with_me/controllers/data_controller.dart';
// import 'package:walk_with_me/controllers/location_controller.dart';
import 'package:walk_with_me/utils/utils.dart';

class SearchSuggestion extends StatelessWidget {
  const SearchSuggestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CityController cityController = Get.find<CityController>();
    DataController dataController = Get.find<DataController>();
    final TextEditingController _typeAheadController = TextEditingController();
    return TypeAheadField(
      textFieldConfiguration: TextFieldConfiguration(
        autofocus: false,
        style: DefaultTextStyle.of(context)
            .style
            .copyWith(fontStyle: FontStyle.italic),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          border: const OutlineInputBorder(),
          hintText: 'search_for_anything'.tr,
        ),
        controller: _typeAheadController,
      ),
      suggestionsCallback: (pattern) {
        List<String> cityNames = [];
        for (var city in dataController.cityList.value) {
          cityNames.add(city.name!);
        }
        return Utils.getSuggestions(pattern, cityNames);
      },
      itemBuilder: (context, suggestion) {
        return ListTile(
          leading: const Icon(Icons.travel_explore),
          title: Text(suggestion.toString()),
        );
      },
      onSuggestionSelected: (suggestion) {
        cityController.changeSuggestedCity(suggestion.toString());
        _typeAheadController.text = suggestion.toString();
      },
    );
  }
}
