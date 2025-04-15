import 'package:equatable/equatable.dart';

class Story extends Equatable {
  final String title;
  final String content;
  final String image;
  final String sound;

  const Story({
    required this.title,
    required this.content,
    required this.image,
    required this.sound,
  });

  @override
  List<Object?> get props => [title, content, image, sound];
}