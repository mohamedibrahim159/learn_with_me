import 'package:bloc/bloc.dart';
import 'package:learn_with_me/presentation/blocs/number_state.dart';
import 'package:equatable/equatable.dart';
import 'package:learn_with_me/core/usecases/usecase.dart';
import 'package:learn_with_me/domain/entities/number.dart';
import 'failures_bloc.dart';

import '../../domain/usecases/get_numbers.dart';

part 'number_event.dart';
part 'number_state.dart';

class NumberBloc extends Bloc<NumberEvent, NumberState> {
  final GetNumbers getNumbersUseCase;
  NumberBloc({required this.getNumbersUseCase}) : super(NumberState.initial()) {
    on<GetNumbersEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true, errorMessage: ''));

      final failureOrNumbers = await getNumbersUseCase(NoParams());

      failureOrNumbers.fold((failure) {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: mapFailureToMessage(failure),
        ));
      }, (numbers) {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: '',
          numbers: numbers,
        ));
      });
    });
  }
}
