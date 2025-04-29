import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learn_with_me/core/errors/failures.dart';
import 'package:learn_with_me/core/usecases/usecase.dart';
import 'package:learn_with_me/domain/entities/animal.dart';
import 'package:learn_with_me/domain/usecases/get_animals.dart';
import 'package:learn_with_me/presentation/blocs/failures_bloc.dart';
part 'animal_state.dart';
part 'animal_event.dart';

class AnimalBloc extends Bloc<AnimalEvent, AnimalState> {
  final GetAnimals _getAnimals;
  AnimalBloc({required GetAnimals getAnimals})
      : _getAnimals = getAnimals,super(AnimalState.initial()){
    on<GetAnimalsEvent>((event, emit) async {
      _onGetAnimals(event, emit);
    });
  }

   void _onGetAnimals(GetAnimalsEvent event, Emitter<AnimalState> emit) async {
    
    emit(state.copyWith(isLoading: true, errorMessage: ''));
    final failureOrAnimals = await _getAnimals(NoParams());
    failureOrAnimals.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        errorMessage: mapFailureToMessage(failure),
      )),
      (animals) => emit(state.copyWith(
        isLoading: false,
        animals: animals,
      )),
    );
  }