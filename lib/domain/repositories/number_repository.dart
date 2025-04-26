import 'package:dartz/dartz.dart';
import '../../core/errors/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/number.dart';

abstract class NumberRepository {
  Future<Either<Failure, List<Number>>> getNumbers(NoParams params);
}