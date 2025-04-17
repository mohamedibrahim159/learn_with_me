import 'package:bloc/bloc.dart';
import '../../domain/usecases/authenticate_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticateUser authenticateUser;
  AuthBloc({required this.authenticateUser}) : super(AuthInitial()) {
    on<AuthenticateUserEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await authenticateUser(NoParams());
      result.fold(
        (failure) => emit(AuthError(message: failure.message)),
        (user) => emit(AuthAuthenticated(user: user)),
      );
    });
  }
}