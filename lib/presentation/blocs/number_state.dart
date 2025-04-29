import 'package:equatable/equatable.dart';
import 'package:learn_with_me/domain/entities/number.dart';

class NumberState extends Equatable {
 final bool isLoading;
  final String errorMessage;
  final List<Number> numbers;

  const NumberState({
    required this.isLoading,
    required this.errorMessage,
    required this.numbers,
  });

  NumberState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<Number>? numbers,
  }) {
    return  NumberState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      numbers: numbers ?? this.numbers,
    );
  }

  factory NumberState.initial() {
    return const NumberState(isLoading: false, errorMessage: '', numbers: []);
  }

  @override
  List<Object> get props => [isLoading, errorMessage, numbers];
}