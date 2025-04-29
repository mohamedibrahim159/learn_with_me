import 'package:dartz/dartz.dart';
import 'package:learn_with_me/core/errors/failures.dart';
import 'package:learn_with_me/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> authenticateUser();
  Future<Either<Failure, User>> loginAnonymously();
}