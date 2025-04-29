import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';
import '../../core/usecases/usecase.dart';

class AuthenticateUser extends UseCase<User, NoParams> {
  final UserRepository userRepository;

  AuthenticateUser({required this.userRepository}); 
    @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await userRepository.authenticateUser();
  }
}