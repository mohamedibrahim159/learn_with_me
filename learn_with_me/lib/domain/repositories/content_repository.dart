import '../entities/animal.dart';
import '../entities/color.dart';
import '../entities/story.dart';
import '../../core/usecases/usecase.dart';
import '../../core/errors/failures.dart';

abstract class ContentRepository {
  Future<Either<Failure, List<Animal>>> getAnimals();
  Future<Either<Failure, List<Color>>> getColors();
  Future<Either<Failure, List<Story>>> getStories();
}