import 'package:equatable/equatable.dart';

class Letter extends Equatable {
  final String name;
  final String sound;
  final String image;
  
  const Letter({
    required this.name,
    required this.sound,
    required this.image,
  });

  @override
  List<Object?> get props => [name, sound, image];
}