import 'package:dartz/dartz.dart';
import '../../core/errors/failures.dart';
import '../entities/letter.dart';
import 'empty_repository.dart';

abstract class LetterRepository extends Repository {
  Future<Either<Failure, List<Letter>>> getLetters();
}