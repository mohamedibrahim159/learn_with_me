import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart'; 
import '../../core/usecases/usecase.dart';
import '../entities/letter.dart';
abstract class LetterRepository  {
  Either<Failure, List<Letter>> getLetters( );
}