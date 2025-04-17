import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/color.dart';
import '../../core/usecases/usecase.dart';
import '../../core/errors/failures.dart';

abstract class ColorEvent {}

class GetColors extends ColorEvent {}

class AddColor extends ColorEvent {}

class DeleteColor extends ColorEvent {}

abstract class ColorState {}

class ColorInitial extends ColorState {}

class ColorLoading extends ColorState {}

class ColorLoaded extends ColorState {
  final List<Color> colors;
  ColorLoaded(this.colors);
}

class ColorError extends ColorState {
  final Failure failure;
  ColorError(this.failure);
}

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  final GetColors getColors;

  ColorBloc(this.getColors) : super(ColorInitial()) {
    on<GetColors>((event, emit) async {
      emit(ColorLoading());
      final result = await getColors(NoParams());
      result.fold(
        (failure) => emit(ColorError(failure)),
        (colors) => emit(ColorLoaded(colors)),
      );
    });
  }
}