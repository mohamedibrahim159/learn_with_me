import 'package:equatable/equatable.dart';

class Color with EquatableMixin {
  final String name;
  final String sound;
  final String image;

   Color({
    required this.name,
    required this.sound,
    required this.image,
  }) ;

  @override
  List<Object?> get props => [name, sound, image];
}