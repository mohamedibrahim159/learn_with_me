import 'package:equatable/equatable.dart';
import 'package:learn_with_me/domain/entities/letter.dart';


class LetterState extends Equatable {
  final bool isLoading;
  final String errorMessage;
  final List<Letter> letters;

  const LetterState({
    required this.isLoading,
    required this.errorMessage,
    required this.letters,
  });

  LetterState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<Letter>? letters,  
  }) {
    return  LetterState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      letters: letters ?? this.letters,
    );
  }
  factory LetterState.initial() {
    return const LetterState(isLoading: false, errorMessage: '', letters: []);
  }

  @override
  List<Object> get props => [isLoading, errorMessage, letters];
}