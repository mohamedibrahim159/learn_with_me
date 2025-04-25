import 'package:equatable/equatable.dart';

class Letter with EquatableMixin {
  final String letter;
  final String audioPath;
  const Letter({
    required this.letter,
    required this.audioPath,
  });

  @override
  List<Object?> get props => [letter, audioPath];
}