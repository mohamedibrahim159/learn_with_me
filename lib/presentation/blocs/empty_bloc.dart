import 'package:flutter_bloc/flutter_bloc.dart';

part 'empty_event.dart';
part 'empty_state.dart';

class EmptyBloc extends Bloc<EmptyEvent, EmptyState> {
  EmptyBloc() : super(EmptyInitial()) {
    on<EmptyEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}