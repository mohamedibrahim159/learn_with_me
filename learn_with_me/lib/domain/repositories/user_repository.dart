import '../../core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import '../../core/usecases/usecase.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> authenticateUser();
    Future<Either<Failure, User>> loginAnonymously();
}