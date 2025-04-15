import 'package:equatable/equatable.dart';

class Number extends Equatable {
  final int value;
  final String sound;
  final String image;

  Number({
    required this.value,
    required this.sound,
    required this.image,
  });

  @override
  List<Object?> get props => [
        value,
        sound,
        image,
      ];
}