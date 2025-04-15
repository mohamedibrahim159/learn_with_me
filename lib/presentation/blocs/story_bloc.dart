import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/story.dart';
import '../../domain/usecases/get_stories.dart';

part 'story_event.dart';
part 'story_state.dart';

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  final GetStories getStories;
  StoryBloc({required this.getStories}) : super(StoryInitial()) {
    on<GetStories>((event, emit) async {
      emit(StoryLoading());
      final failureOrStories = await getStories(NoParams());
      failureOrStories.fold(
        (failure) => emit(StoryError(message: failure.message)),
        (stories) => emit(StoryLoaded(stories: stories)),
      );
    });
    on<AddStory>((event, emit) {
      
    });
        on<DeleteStory>((event, emit) {
      
    });
  }
}