import 'package:dartz/dartz.dart';
import 'package:learn_with_me/core/errors/failures.dart';
import 'package:learn_with_me/domain/entities/animal.dart';
import 'package:learn_with_me/domain/entities/story.dart';

abstract class ContentRepository {
  Future<Either<Failure, List<Animal>>> getAnimals();
  Future<Either<Failure, List<Story>>> getStories();
}