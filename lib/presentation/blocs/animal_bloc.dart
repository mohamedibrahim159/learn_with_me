import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/animal.dart';
import '../../domain/usecases/get_animals.dart';

part 'animal_event.dart';
part 'animal_state.dart';

class AnimalBloc extends Bloc<AnimalEvent, AnimalState> {
  final GetAnimals getAnimals;
  AnimalBloc({required this.getAnimals}) : super(AnimalInitial()) {
    on<GetAnimals>((event, emit) async {
      emit(AnimalLoading());
      final failureOrAnimals = await getAnimals(NoParams());
      failureOrAnimals.fold(
        (failure) => emit(AnimalError(message: failure.message)),
        (animals) => emit(AnimalLoaded(animals: animals)),
      );
    });
    on<AddAnimal>((event, emit) {
      
    });
      on<DeleteAnimal>((event, emit) {
      
    });
  }
}