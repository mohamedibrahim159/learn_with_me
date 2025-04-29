import 'package:equatable/equatable.dart';
import '../../domain/entities/story.dart';

class StoryModel extends Story with EquatableMixin{
  final String name;
  final String audioPath;

  const StoryModel({
    required this.name,
    required this.audioPath,
  }) : super(name: name, audioPath: audioPath);

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      name: json['name'],
      audioPath: json['audioPath'],
    );
  }

  Story toEntity() {
    return Story(name: name, audioPath: audioPath);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'audioPath': audioPath,
    };
  }

  @override
  List<Object?> get props => [name, audioPath];
}