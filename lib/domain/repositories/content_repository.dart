import '../entities/animal.dart';
import '../entities/color.dart';
import '../entities/story.dart';
import '../../core/usecases/usecase.dart';
import '../../core/errors/failures.dart';

abstract class ContentRepository {
  Either<Failure, List<Animal>> getAnimals();
  Either<Failure, List<Color>> getColors();
  Either<Failure, List<Story>> getStories();
}