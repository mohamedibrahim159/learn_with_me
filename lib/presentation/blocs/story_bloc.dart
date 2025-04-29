import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learn_with_me/core/errors/failures.dart';
import 'package:learn_with_me/core/usecases/usecase.dart';
import 'package:learn_with_me/domain/entities/story.dart';
import 'package:learn_with_me/domain/usecases/get_stories.dart';
import 'package:learn_with_me/presentation/blocs/failures_bloc.dart';

part 'story_event.dart';

part 'story_state.dart';

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  final GetStories _getStories;

  StoryBloc({required GetStories getStories})
      : _getStories = getStories,
        super(StoryState.initial()) {
    on<GetStoriesEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true, errorMessage: ''));

      final failureOrStories = await _getStories(NoParams());

      failureOrStories.fold(
        (failure) {
          emit(state.copyWith(
            isLoading: false,
            errorMessage: mapFailureToMessage(failure),
          ));
        },
        (stories) => emit(state.copyWith(isLoading: false, stories: stories)),
      );
    });
  }
}