import 'package:dartz/dartz.dart';
import 'package:learn_with_me/core/errors/failures.dart';
import 'package:learn_with_me/data/datasources/user_local_datasource.dart';
import 'package:learn_with_me/data/models/user_model.dart';
import 'package:learn_with_me/domain/entities/user.dart';
import 'package:learn_with_me/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource localDataSource;

  UserRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, User>> authenticateUser() async {
    try {
      final result = await localDataSource.authenticateUser();
      return Right(UserModel.fromJson(result));
    } on Exception {
        return const Left(ServerFailure(message: ''));
    }
  }
}