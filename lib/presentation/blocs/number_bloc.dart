import 'package:bloc/bloc.dart';
import '../../domain/usecases/get_numbers.dart';

part 'number_event.dart';
part 'number_state.dart';

class NumberBloc extends Bloc<NumberEvent, NumberState> {
  final GetNumbers getNumbers;
  NumberBloc({required this.getNumbers}) : super(NumberInitial()) {
    on<GetNumbers>((event, emit) async {
      emit(NumberLoading());
      final failureOrNumbers = await getNumbers(NoParams());
      failureOrNumbers.fold(
        (failure) => emit(NumberError(message: failure.message)),
        (numbers) => emit(NumberLoaded(numbers: numbers)),
      );
    });
  }
}