import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/errors/failures.dart';
import '../../../domain/entities/letter.dart';
import '../../../core/usecases/usecase.dart';
import '../../../domain/usecases/get_letters.dart';

part 'letter_event.dart';
part 'letter_state.dart';

class LetterBloc extends Bloc<LetterEvent, LetterState> {
  final GetLetters _getLetters;

  LetterBloc({required GetLetters getLetters})
      : _getLetters = getLetters,
        super(LetterState.initial()) {
    on<GetLettersEvent>(_onGetLetters);
  }

  void _onGetLetters(GetLettersEvent event, Emitter<LetterState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: ''));
    final failureOrLetters = await _getLetters(NoParams());
    failureOrLetters.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        errorMessage: _mapFailureToMessage(failure),
      )),
      (letters) => emit(state.copyWith(
        isLoading: false,
        letters: letters,
        errorMessage: '',
      )),
    );
  }





  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      case CacheFailure:
        return 'Cache Failure';
      default:
        return 'Unexpected Error';
    }
  }
}