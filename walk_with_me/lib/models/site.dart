class Site {
  String imageUrl;
  String name;
  String description;
  List<String> category;
  Uri audioSource = Uri.parse(
      "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3");

  Site({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.category,
  });
}
