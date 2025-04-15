import 'package:dartz/dartz.dart';
import '../../core/errors/failures.dart';
import '../entities/number.dart';
import 'empty_repository.dart';

abstract class NumberRepository extends Repository {
  Future<Either<Failure, List<Number>>> getNumbers();
}