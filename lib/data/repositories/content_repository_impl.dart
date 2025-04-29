import 'package:dartz/dartz.dart';
import 'package:learn_with_me/core/errors/failures.dart';
import 'package:learn_with_me/data/datasources/content_local_datasource.dart';
import 'package:learn_with_me/data/models/animal_model.dart';
import 'package:learn_with_me/data/models/story_model.dart';
import 'package:learn_with_me/domain/entities/animal.dart';
import 'package:learn_with_me/domain/repositories/content_repository.dart';
import 'package:learn_with_me/domain/entities/story.dart';

class ContentRepositoryImpl implements ContentRepository {
  final ContentLocalDataSource contentLocalDataSource;

  ContentRepositoryImpl({required this.contentLocalDataSource});

  @override
  Future<Either<Failure, List<Animal>>> getAnimals() async {
    try {
      final result = await contentLocalDataSource.getAnimals();
      final animals = result.map((e) => e.toEntity()).toList();
      return Right(animals);
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Story>>> getStories() async {
    try {
      final result = await contentLocalDataSource.getStories();
      final stories = result.map((e) => e.toEntity()).toList();
      return Right(stories);
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}