import 'package:equatable/equatable.dart';
import '../../domain/entities/number.dart';

class NumberModel extends Number with EquatableMixin {
  final String name;
  final String sound;
  final String image;

  const NumberModel({
    required this.name,
    required this.sound,
    required this.image,
  }) : super(name: name, sound: sound, image: image);

  factory NumberModel.fromJson(Map<String, dynamic> json) {
    return NumberModel(
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