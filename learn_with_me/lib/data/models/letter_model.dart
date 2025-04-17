

class LetterModel extends Letter with EquatableMixin {
  final String name;
  final String sound;
  final String image;

  const LetterModel({
    required this.name,
    required this.sound,
    required this.image,
  }) : super(name: name, sound: sound, image: image);

  factory LetterModel.fromJson(Map<String, dynamic> json) {
    return LetterModel(
      name: json['name'],
      sound: json['sound'],
      image: json['image'],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'sound': sound,
      'image': image,
    };
  }

  @override
  List<Object?> get props => [name, sound, image];
}