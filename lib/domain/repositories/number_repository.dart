import 'package:dartz/dartz.dart';
import 'package:learn_with_me/core/errors/failures.dart';
import 'package:learn_with_me/core/usecases/usecase.dart';
import 'package:learn_with_me/domain/entities/number.dart';

abstract class NumberRepository {
  Future<Either<Failure, List<Number>>> getNumbers(NoParams params); 
}