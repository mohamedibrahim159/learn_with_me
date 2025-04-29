import 'package:equatable/equatable.dart';
import '../../domain/entities/number.dart';

class NumberModel extends Number with EquatableMixin {
  final int number;
  final String audioPath;

  const NumberModel({
    required this.number,
    required this.audioPath,
  }) : super(number: number, audioPath: audioPath);

  factory NumberModel.fromJson(Map<String, dynamic> json) {
    return NumberModel(
      number: json['number'],
      audioPath: json['audioPath'],
    );
  }

  Number toEntity() {
    return Number(number: number, audioPath: audioPath);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'number': number,
      'audioPath': audioPath,
    };
  }

  @override
  List<Object?> get props => [number, audioPath];
}