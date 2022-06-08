// ignore_for_file: file_names

class City {
  String imageUrl;
  String city;
  String country;
  String description;

  City({
    required this.imageUrl,
    required this.city,
    required this.country,
    required this.description,
  });
}

List<City> cities = [
  City(
    imageUrl: 'assets/images/barcelona.jpeg',
    city: 'Barcelona',
    country: 'Spain',
    description: 'Visit Barcelona for an amazing and unforgettable adventure.',
  ),
  City(
    imageUrl: 'assets/images/dublin.jpeg',
    city: 'Dublin',
    country: 'Ireland',
    description: 'Visit Dublin for an amazing and unforgettable adventure.',
  ),
  City(
    imageUrl: 'assets/images/rome.jpeg',
    city: 'Rome',
    country: 'Italy',
    description: 'Visit Rome for an amazing and unforgettable adventure.',
  ),
  City(
    imageUrl: 'assets/images/munich.jpeg',
    city: 'Munich',
    country: 'Germany',
    description: 'Visit Munich for an amazing and unforgettable adventure.',
  ),
  City(
    imageUrl: 'assets/images/london.jpeg',
    city: 'London',
    country: 'United Kingdom',
    description: 'Visit London for an amazing and unforgettable adventure.',
  ),
];
