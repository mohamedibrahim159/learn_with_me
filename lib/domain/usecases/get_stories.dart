import 'package:equatable/equatable.dart';
import '../entities/story.dart';
import '../repositories/content_repository.dart';

class GetStories extends Equatable {
  final ContentRepository contentRepository;

  const GetStories(this.contentRepository);

  Future<List<Story>> execute() async {
    return await contentRepository.getStories();
  }

  @override
  List<Object?> get props => [contentRepository];
}