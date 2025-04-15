import 'package:equatable/equatable.dart';

class Letter with EquatableMixin {
   String name;
   String sound;
   String image;
  const Letter({
    required this.name,
    required this.sound,
    required this.image,
  });

  @override
  List<Object?> get props => [name, sound, image];
}