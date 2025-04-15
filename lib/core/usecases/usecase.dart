import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../errors/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class NoParams {}

class UseCaseNoParams<Type> extends UseCase<Type, NoParams> {
  @override
  Future<Either<Failure, Type>> call(NoParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}