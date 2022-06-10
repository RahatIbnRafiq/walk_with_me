import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:walk_with_me/services/backend_service.dart';

class SearchSuggestion extends StatelessWidget {
  const SearchSuggestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TypeAheadField(
      textFieldConfiguration: TextFieldConfiguration(
        autofocus: false,
        style: DefaultTextStyle.of(context)
            .style
            .copyWith(fontStyle: FontStyle.italic),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          //labelText: 'search_for_anything'.tr,
          border: const OutlineInputBorder(),
          //labelStyle: Theme.of(context).textTheme.bodyText2,
          hintText: 'search_for_anything'.tr,
        ),
      ),
      suggestionsCallback: (pattern) {
        return CitiesService.getSuggestions(pattern);
      },
      itemBuilder: (context, suggestion) {
        return ListTile(
          leading: const Icon(Icons.travel_explore),
          title: Text(suggestion.toString()),
        );
      },
      onSuggestionSelected: (suggestion) {},
    );
  }
}
