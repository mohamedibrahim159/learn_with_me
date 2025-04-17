import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learn_with_me/core/errors/failures.dart';
import 'package:learn_with_me/core/usecases/usecase.dart';
import 'package:learn_with_me/domain/entities/animal.dart';
import '../../domain/usecases/get_animals.dart';

part 'animal_event.dart';
part 'animal_state.dart';

class AnimalBloc extends Bloc<AnimalEvent, AnimalState> {
  final GetAnimals _getAnimals;
  AnimalBloc({required GetAnimals getAnimals})
      : _getAnimals = getAnimals,
        super(AnimalInitial()) {
    on<GetAnimalsEvent>((event, emit) async {
      emit(AnimalLoading());
      final failureOrAnimals = await _getAnimals(NoParams());
      failureOrAnimals.fold(
        (failure) {
          emit(AnimalError(message: failure.message));
        },
        (animals) {
          emit(AnimalLoaded(animals: animals));
        },
      );
    });
  }
}