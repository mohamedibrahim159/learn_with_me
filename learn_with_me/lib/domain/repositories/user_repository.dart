import '../../core/errors/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Either<Failure, User> authenticateUser();
}