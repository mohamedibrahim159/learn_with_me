import 'package:equatable/equatable.dart';
import '../../domain/entities/number.dart';

class NumberModel extends Number with EquatableMixin{
  const NumberModel({
    required super.name,
    required super.sound,
    required super.image,
  });
    factory NumberModel.fromMap(Map<String, dynamic> map) {
    return NumberModel(
      name: map['name'] as String,
      sound: map['sound'] as String,
      image: map['image'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name':name,
      'sound':sound,
      'image':image,
    };
  }

  @override
  List<Object?> get props => [
        name,sound,image
      ];
}