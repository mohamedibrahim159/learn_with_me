import '../models/animal_model.dart';
import '../models/story_model.dart';

abstract class ContentLocalDataSource {
  Future<List<AnimalModel>> getAnimals();
    Future<List<StoryModel>> getStories();
}