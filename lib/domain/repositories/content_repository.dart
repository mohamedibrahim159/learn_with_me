import '../entities/letter.dart';
import '../entities/number.dart';
import '../entities/animal.dart';
import '../entities/color.dart';
import '../entities/story.dart';

abstract class ContentRepository {
  Future<List<Letter>> getLetters();
  Future<List<Number>> getNumbers();
  Future<List<Animal>> getAnimals();
  Future<List<Color>> getColors();
  Future<List<Story>> getStories();
}