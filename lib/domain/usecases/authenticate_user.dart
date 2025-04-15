import '../../core/usecases/usecase.dart';
import '../../core/errors/failures.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class AuthenticateUser extends UseCase<User, NoParams> {
  final UserRepository userRepository;

  AuthenticateUser({required this.userRepository});

  @override
  Either<Failure, User> call(NoParams params) {
    return userRepository.authenticateUser();
  }

}