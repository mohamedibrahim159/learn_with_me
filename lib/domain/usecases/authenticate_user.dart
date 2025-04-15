import 'package:equatable/equatable.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class AuthenticateUser extends Equatable {
  final UserRepository userRepository;

  const AuthenticateUser({required this.userRepository});

  Future<User> execute() async {
    return await userRepository.authenticate();
  }

  @override
  List<Object?> get props => [userRepository];
}