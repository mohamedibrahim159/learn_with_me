
import 'package:equatable/equatable.dart';
import '../../../domain/entities/letter.dart';

class LetterModel extends Letter with EquatableMixin{
  final String letter;
  final String audioPath;

  const LetterModel({
    required this.letter,
    required this.audioPath,
  }) : super(letter: letter, audioPath: audioPath);

  factory LetterModel.fromJson(Map<String, dynamic> json) {
    return LetterModel(
      letter: json['letter'],
      audioPath: json['audioPath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'letter': letter,
      'audioPath': audioPath,
    };
  }

  Letter toEntity() {
    return Letter(letter: letter, audioPath: audioPath);
  }

  @override
  List<Object?> get props => [letter, audioPath];
}