import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:learn_with_me/core/errors/failures.dart';
import 'package:learn_with_me/core/services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;
  AuthBloc({required AuthService authService})
      : _authService = authService,
        super(const AuthInitial()) {
    on<AuthCheckRequested>((event, emit) {
      try {
        if (_authService.isLoggedIn()) {
          emit(const AuthAuthenticated());
        } else {
          emit(const AuthUnauthenticated());
        }
      } catch (e) {
        emit(const AuthUnauthenticated());
      }
    });

    on<AuthSignInWithEmailAndPasswordRequested>((event, emit) async {
      try {
        emit(const AuthLoading());
        await _authService.signInWithEmailAndPassword(
            email: event.email, password: event.password);
        emit(const AuthAuthenticated());
      } on AuthFailure catch (e) {
        emit(AuthFailure(errorMessage: e.message));
      } catch (e) {
        debugPrint(e.toString());
        emit(const AuthFailure(errorMessage: 'Unexpected error'));
      }
    });

    on<AuthSignInWithGoogleRequested>((event, emit) async {
      try {
        emit(const AuthLoading());
        await _authService.signInWithGoogle();
        emit(const AuthAuthenticated());
      } on AuthFailure catch (e) {
        emit(AuthFailure(errorMessage: e.message));
      } catch (e) {
        debugPrint(e.toString());
        emit(const AuthFailure(errorMessage: 'Unexpected error'));
      }
    });

    on<AuthSignInWithFacebookRequested>((event, emit) async {
      try {
        emit(const AuthLoading());
        await _authService.signInWithFacebook();
        emit(const AuthAuthenticated());
      } on AuthFailure catch (e) {
        emit(AuthFailure(errorMessage: e.message));
      } catch (e) {
        debugPrint(e.toString());
        emit(const AuthFailure(errorMessage: 'Unexpected error'));
      }
    });

    on<AuthSignOutRequested>((event, emit) async {
      try {
        emit(const AuthLoading());
        await _authService.signOut();
        emit(const AuthUnauthenticated());
      } on AuthFailure catch (e) {
        emit(AuthFailure(errorMessage: e.message));
      } catch (e) {
        debugPrint(e.toString());
        emit(const AuthFailure(errorMessage: 'Unexpected error'));
      }
    });
  }
}

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthCheckRequested extends AuthEvent {
  const AuthCheckRequested();
}

class AuthSignInWithEmailAndPasswordRequested extends AuthEvent {
  final String email;
  final String password;
  const AuthSignInWithEmailAndPasswordRequested(
      {required this.email, required this.password});
}

class AuthSignInWithGoogleRequested extends AuthEvent {
  const AuthSignInWithGoogleRequested();
}

class AuthSignInWithFacebookRequested extends AuthEvent {
  const AuthSignInWithFacebookRequested();
}

class AuthSignOutRequested extends AuthEvent {
  const AuthSignOutRequested();
}

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthSuccess extends AuthState {
  const AuthSuccess();
}

class AuthFailure extends AuthState {
  final String errorMessage;
  const AuthFailure({required this.errorMessage});
    @override
  List<Object?> get props => [errorMessage];
}

class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}

class AuthAuthenticated extends AuthState {
  const AuthAuthenticated();
}