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
      : _getAnimals = getAnimals,super(AnimalState.initial()){
    on<GetAnimalsEvent>((event, emit) async {
      _onGetAnimals(event, emit);
    });
  }

   void _onGetAnimals(GetAnimalsEvent event, Emitter<AnimalState> emit) async {
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

    emit(state.copyWith(isLoading: true, errorMessage: ''));
    final failureOrAnimals = await _getAnimals(NoParams());
    failureOrAnimals.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        errorMessage: _mapFailureToMessage(failure),
      )),
      (animals) => emit(state.copyWith(
        isLoading: false,
        animals: animals,
      )),
    );
  }
}

class AnimalState extends Equatable {
  final bool isLoading;
  final String errorMessage;
  final List<Animal> animals;

  const AnimalState({
    required this.isLoading,
    required this.errorMessage,
    required this.animals,
  });

  AnimalState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<Animal>? animals,
  }) {
    return AnimalState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      animals: animals ?? this.animals,
    );
  }

  factory AnimalState.initial() {
    return const AnimalState(isLoading: false, errorMessage: '', animals: []);
  }

  @override
  List<Object> get props => [isLoading, errorMessage, animals];
}