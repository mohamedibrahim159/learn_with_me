import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';
import '../../core/usecases/usecase.dart';

class AuthenticateUser extends UseCase<User, void> {
  final UserRepository userRepository;

  AuthenticateUser({required this.userRepository});

  @override
  Future<Either<Failure, User>> call(void params) async {
    return await userRepository.authenticateUser();
  }

  Future<Either<Failure, User>> loginAnonymously() async {
    return await userRepository.loginAnonymously();
  }
}