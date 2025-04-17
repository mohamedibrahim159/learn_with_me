import 'package:equatable/equatable.dart';
import '../../domain/entities/color.dart';

class ColorModel extends Color with EquatableMixin {
  final String name;
  final String sound;
  final String image;

  const ColorModel({
    required this.name,
    required this.sound,
    required this.image,
  }) : super(name: name, sound: sound, image: image);

  factory ColorModel.fromJson(Map<String, dynamic> json) {
    return ColorModel(
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