import 'package:equatable/equatable.dart';
import '../../../domain/entities/animal.dart';

class AnimalModel extends Animal with EquatableMixin {
  final String name;
  final String sound;
  final String image;

  const AnimalModel({
    required this.name,
    required this.sound,
    required this.image,
  }) : super(name: name, sound: sound, image: image);

  factory AnimalModel.fromJson(Map<String, dynamic> json) {
    return AnimalModel(
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