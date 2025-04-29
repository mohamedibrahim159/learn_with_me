import 'package:equatable/equatable.dart';

abstract class NumberEvent extends Equatable {
  const NumberEvent();

  @override
  List<Object> get props => [];
}

class GetNumbersEvent extends NumberEvent { }