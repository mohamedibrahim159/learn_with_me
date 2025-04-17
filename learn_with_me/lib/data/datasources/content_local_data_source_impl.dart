import 'package:learn_with_me/data/datasources/content_local_datasource.dart';
import 'package:learn_with_me/data/datasources/mock_data.dart';
import 'package:learn_with_me/data/models/animal_model.dart';
import 'package:learn_with_me/data/models/color_model.dart';
import 'package:learn_with_me/data/models/story_model.dart';

class ContentLocalDataSourceImpl implements ContentLocalDataSource {
  @override
  Future<List<AnimalModel>> getAnimals() async {
    return mockAnimals;
  }

  @override
  Future<List<ColorModel>> getColors() async {
    return mockColors;
  }

  @override
  Future<List<StoryModel>> getStories() async {
    return mockStories;
  }
}