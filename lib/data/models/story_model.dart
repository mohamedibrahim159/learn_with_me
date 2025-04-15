import 'package:equatable/equatable.dart';
import '../../domain/entities/story.dart';

class StoryModel extends Story with EquatableMixin {
  final String name;
  final String sound;
  final String image;
  final String content;

  const StoryModel({
    required this.name,
    required this.sound,
    required this.image,
    required this.content,
  }) : super(name: name, sound: sound, image: image, content: content);

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      name: json['name'],
      sound: json['sound'],
      image: json['image'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'sound': sound,
      'image': image,
      'content': content,
    };
  }

  @override
  List<Object?> get props => [name, sound, image, content];
}