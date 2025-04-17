import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_with_me/domain/usecases/get_colors.dart';
import '../../domain/entities/color.dart';
import '../../core/usecases/usecase.dart';
import '../../core/errors/failures.dart';

abstract class ColorEvent {} // Define abstract ColorEvent class

class GetColorsEvent extends ColorEvent {} // Define GetColorsEvent

abstract class ColorState {} // Define abstract ColorState class

class ColorInitial extends ColorState {} // Define ColorInitial state

class ColorLoading extends ColorState {} // Define ColorLoading state

class ColorLoaded extends ColorState { // Define ColorLoaded state
  final List<Color> colors;
  ColorLoaded(this.colors);
}

class ColorError extends ColorState { // Define ColorError state
  final String errorMessage;
  ColorError(this.errorMessage);
}
class ColorBloc extends Bloc<ColorEvent, ColorState> { // Define ColorBloc
  final GetColors getColors; // Declare getColors usecase
  ColorBloc(this.getColors) : super(ColorInitial()) {
    on<GetColorsEvent>((event, emit) async { // Implement GetColorsEvent handler
      emit(ColorLoading()); // Emit loading state
      final result = await getColors(NoParams()); // Get colors from usecase
      result.fold(
            (failure) => emit(ColorError(failure.message)), // Emit error state with message
            (colors) => emit(ColorLoaded(colors)), // Emit loaded state with colors data
      );
    });
  }
  final List<Color> colors;
  // Constructor to initialize ColorBloc with a list of colors
  ColorBloc(this.getColors, {this.colors = const []}) : super(ColorInitial());
}