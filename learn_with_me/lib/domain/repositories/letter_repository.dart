import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart'; 
import '../../core/usecases/usecase.dart';
import '../entities/letter.dart';
abstract class LetterRepository  {
  Future<Either<Failure, List<Letter>>> getLetters(NoParams params);
}