import 'package:learn_with_me/core/errors/failures.dart';
import 'package:learn_with_me/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetEmptyEntity implements UseCase<EmptyEntity, NoParams> {
  @override
  Future<Either<Failure, EmptyEntity>> call(NoParams params) async {
    return Right(EmptyEntity());
  }
}