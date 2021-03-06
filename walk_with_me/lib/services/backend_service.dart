import 'dart:math';

class BackendService {
  static Future<List> getSuggestions(String query) async {
    await Future.delayed(const Duration(seconds: 1));

    return List.generate(3, (index) {
      return {'name': query + index.toString(), 'price': Random().nextInt(100)};
    });
  }
}

class CitiesService {
  static final List<String> cities = [
    'Berlin',
    'Dhaka',
    'San Fransisco',
    'Rome',
    'Los Angeles',
    'Madrid',
    'Bali',
    'Barcelona',
    'Paris',
    'Bucharest',
    'New York City',
    'Philadelphia',
    'Sydney',
  ];

  static List<String> getSuggestions(String query) {
    List<String> matches = [];
    if (query.isEmpty) {
      return matches;
    }
    matches.addAll(cities);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    if (matches.length > 3) {
      return matches.sublist(0, 4);
    }
    return matches;
  }
}
