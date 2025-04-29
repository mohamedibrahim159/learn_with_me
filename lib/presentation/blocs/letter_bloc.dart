import 'package:bloc/bloc.dart';
import 'package:learn_with_me/core/errors/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:learn_with_me/core/usecases/usecase.dart';
import 'package:learn_with_me/domain/entities/letter.dart';
import 'package:learn_with_me/domain/usecases/get_letters.dart';
import 'package:learn_with_me/presentation/blocs/failures_bloc.dart';

part 'letter_state.dart';
part 'letter_event.dart';


class LetterBloc extends Bloc<LetterEvent, LetterState> {
  final GetLetters _getLetters;

  LetterBloc({required GetLetters getLetters})
      : _getLetters = getLetters,
        super(LetterState.initial()) {
    on<GetLettersEvent>(_onGetLetters);
  }

  Future<void> _onGetLetters(
      GetLettersEvent event, Emitter<LetterState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: '')); 
    final failureOrLetters = await _getLetters(NoParams());
    failureOrLetters.fold(
      (failure) => emit(state.copyWith(
          isLoading: false, errorMessage: mapFailureToMessage(failure))),
      (letters) => emit(state.copyWith(isLoading: false, letters: letters)),
    );
  }
}
