class Entity {
  String imageUrl;
  String name;
  String description;

  Entity({
    required this.imageUrl,
    required this.name,
    required this.description,
  });
}

final List<Entity> entities = [
  Entity(
    imageUrl: 'assets/images/paris.jpeg',
    name: 'Eiffel Tower',
    description: "The Eiffel Tower is a wrought-iron",
  ),
  Entity(
    imageUrl: 'assets/images/rome.jpeg',
    name: 'Colosseum',
    description: "Oval amphitheatre in the centre of the city of Rome",
  ),
  Entity(
    imageUrl: 'assets/images/london.jpeg',
    name: 'Tower Bridge',
    description:
        "Tower Bridge is a Grade I listed combined bascule and suspension bridge in London",
  ),
];
