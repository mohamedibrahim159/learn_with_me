import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/errors/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../../domain/usecases/get_letters.dart';

part 'letter_event.dart';
part 'letter_state.dart';

class LetterBloc extends Bloc<LetterEvent, LetterState> {
  final GetLetters getLetters;
  LetterBloc({required this.getLetters}) : super(LetterInitial()) {
    on<GetLettersEvent>((event, emit) async {
      emit(LetterLoading());
      final result = await getLetters(NoParams());
      result.fold(
        (failure) => emit(LetterError(message: _mapFailureToMessage(failure))),
        (letters) => emit(LetterLoaded(letters: letters)),
      );
    });
    on<AddLetter>((event,emit){
      //TODO : add logic here
    });
    on<DeleteLetter>((event,emit){
      //TODO : add logic here
    });
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