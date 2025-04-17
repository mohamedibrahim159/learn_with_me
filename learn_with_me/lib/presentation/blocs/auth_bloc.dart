import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learn_with_me/core/errors/failures.dart';
import 'package:learn_with_me/core/usecases/usecase.dart';
import 'package:learn_with_me/domain/entities/user.dart';
import '../../domain/usecases/authenticate_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticateUser _authenticateUser;
  AuthBloc({required AuthenticateUser authenticateUser})
      : _authenticateUser = authenticateUser,
        super(const AuthState()) {
    on<AnonymousLoginEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await _authenticateUser(NoParams());
      result.fold(
        (failure) => emit(AuthState(errorMessage: failure.message)),
        (user) => emit(AuthState(user: user)),
      );
    });
    on<LogoutEvent>((event, emit) async {
      emit(const AuthState(user: null));
    });
  }
}

class AuthState extends Equatable {
  final User? user;
  final bool isLoading;
  final String? errorMessage;

  const AuthState({this.user, this.isLoading = false, this.errorMessage});

  @override
  List<Object?> get props => [user, isLoading, errorMessage];
}