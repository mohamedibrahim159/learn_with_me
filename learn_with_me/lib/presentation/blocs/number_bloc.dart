import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learn_with_me/core/errors/failures.dart';
import 'package:learn_with_me/core/usecases/usecase.dart';
import 'package:learn_with_me/domain/entities/number.dart';
import '../../domain/usecases/get_numbers.dart';

part 'number_event.dart';
part 'number_state.dart';

class NumberBloc extends Bloc<NumberEvent, NumberState> {
  final GetNumbers getNumbersUseCase;
  NumberBloc({required this.getNumbersUseCase}) : super(NumberState.initial()) {
    on<GetNumbersEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true, errorMessage: ''));

      final failureOrNumbers = await getNumbersUseCase(NoParams());

      failureOrNumbers.fold(
        (failure) => emit(state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
        )),
        (numbers) => emit(state.copyWith(
          isLoading: false,
          numbers: numbers,
        )),
      );
    });
  }
}