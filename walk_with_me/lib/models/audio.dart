import 'dart:typed_data';

class Audio {
  String name;
  Uint8List audio;

  Audio({
    required this.name,
    required this.audio,
  });

  factory Audio.fromMap(Map<String, dynamic> json) => Audio(
        name: json['name'],
        audio: json['audio'],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "audio": audio,
      };
}
