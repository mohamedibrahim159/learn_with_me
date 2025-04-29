import 'package:equatable/equatable.dart';

class Number with EquatableMixin {
  final int number; 
  final String audioPath; 

  const Number({
    required this.number,
    required this.audioPath,
  });

  @override
  List<Object?> get props => [number, audioPath];
}