import 'package:equatable/equatable.dart';

abstract class LetterEvent extends Equatable {
  const LetterEvent();

  @override
  List<Object> get props => [];
}

class GetLettersEvent extends LetterEvent { 
}