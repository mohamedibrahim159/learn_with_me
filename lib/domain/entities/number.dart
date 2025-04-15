import 'package:equatable/equatable.dart';

class Number extends Equatable {
  final String name;
  final String sound;
  final String image;

  const Number({
    required this.name,
    required this.sound,
    required this.image,
  });

  @override
  List<Object?> get props => [
        name,
        sound,
        image,
      ];
}