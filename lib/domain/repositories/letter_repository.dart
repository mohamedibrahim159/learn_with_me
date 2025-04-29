import 'package:dartz/dartz.dart';
import 'package:learn_with_me/core/errors/failures.dart';
import 'package:learn_with_me/core/usecases/usecase.dart';
import 'package:learn_with_me/domain/entities/letter.dart';
abstract class LetterRepository {
  Future<Either<Failure, List<Letter>>> getLetters(NoParams params);
}