import 'package:equatable/equatable.dart';

class Story with EquatableMixin {
  final String name; 
  final String audioPath;

  const Story({
    required this.name,
    required this.audioPath,
  });

  @override
  List<Object?> get props => [name, audioPath];
}