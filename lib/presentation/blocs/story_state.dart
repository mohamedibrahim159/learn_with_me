import 'package:equatable/equatable.dart';
import 'package:learn_with_me/domain/entities/story.dart';

class StoryState extends Equatable { 
  final bool isLoading;
  final String errorMessage;
  final List<Story> stories;

 const StoryState({
    required this.isLoading,
    required this.errorMessage,
    required this.stories,
  });

  StoryState copyWith({
    bool? isLoading, String? errorMessage,List<Story>? stories,
  }) {
    return  StoryState(
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        stories: stories ?? this.stories,
    );
  }
  factory StoryState.initial() {
     return const StoryState(isLoading: false, errorMessage: '', stories: []);
  }

  @override
  List<Object> get props => [isLoading, errorMessage, stories];
}