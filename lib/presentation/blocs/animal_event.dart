import 'package:equatable/equatable.dart';

abstract class AnimalEvent extends Equatable {
 const AnimalEvent();

  @override
  List<Object> get props => [];
}
class GetAnimalsEvent extends AnimalEvent {
}