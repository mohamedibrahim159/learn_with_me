import 'package:equatable/equatable.dart';

class Story extends Equatable {
  final String name;
  final String content;
  final String image;
  final String sound;

  const Story({
    required this.name,
    required this.content,
    required this.image,
    required this.sound,
  });

  @override
  List<Object?> get props => [name, content, image, sound];
}