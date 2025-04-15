import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../errors/failures.dart'; 

typedef Either<T, R> = Future<dartz.Either<T, R>>;

abstract class UseCase<Type, Params> {
  Either<Failure, Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}