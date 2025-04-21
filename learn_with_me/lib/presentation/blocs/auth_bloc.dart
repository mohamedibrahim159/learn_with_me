import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn_with_me/core/errors/failures.dart';
import 'package:learn_with_me/core/services/auth_service.dart';
import 'package:learn_with_me/domain/usecases/authenticate_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;
  final AuthenticateUser authenticateUserUseCase;
  AuthBloc({
    required AuthService authService,
    required this.authenticateUserUseCase,
  })
      : _authService = authService,
        super(const AuthInitial()) {
    on<AuthCheckRequested>((event, emit) async {
      emit(const AuthLoading());
      final authResult = await authenticateUserUseCase(null);
      authResult.fold((failure) => emit(AuthFailure(failure: failure)),
          (user) {
              if (_authService.isLoggedIn()) {
          emit(const AuthAuthenticated());
              } else {
          emit(const AuthUnauthenticated());
              }
          });
      
    });

    on<AuthSignInWithEmailAndPasswordRequested>((event, emit) async {
      try {
          emit(const AuthLoading());
          final user = await _authService.signInWithEmailAndPassword(
              email: event.email, password: event.password);
              if (user != null) {
              // Authentication successful
              // Save user data if needed
                  emit(const AuthAuthenticated());
              } else {
                  emit(const AuthUnauthenticated());
              }
           
          } on FirebaseAuthException catch (e) {
              emit(AuthFailure(failure: e.code));
          }
      
      
       }
    });

    on<AuthSignInWithGoogleRequested>((event, emit) async {
      try {
        emit(const AuthLoading());
        await _authService.signInWithGoogle();
        emit(const AuthAuthenticated());
      } catch (failure) {
        emit(AuthFailure(failure: failure));
      }
        
       }
    });
    on<AuthCreateNewAccountRequested>((event, emit) async {
      try {
        emit(const AuthLoading());
        final user = await _authService.createUserWithEmailAndPassword(
            email: event.email, password: event.password);
            if (user != null) {
               emit(const AuthAuthenticated());
              // Account creation successful, navigate to verify email screen
              
            } else {
                emit(const AuthUnauthenticated());
              // Account creation failed, display error message
            }
      } on FirebaseAuthException catch (e) {
        emit(AuthFailure(failure: e.code));
      }
        
       }
    });
    on<AuthForgotPasswordRequested>((event, emit) async {
      try {
        emit(const AuthLoading());
         await _authService.sendPasswordResetEmail(email: event.email);
        emit(const AuthUnauthenticated());
      } catch (failure) {
        emit(AuthFailure(failure: failure));
      }
        
       }
    });
    on<AuthVerifyEmailRequested>((event, emit) async {
      try {
        emit(const AuthLoading());
        await _authService.sendEmailVerification();
        emit(const AuthUnauthenticated());
        
      } catch (failure) {
        emit(AuthFailure(failure: failure));
      } 
        
       }
    });

    on<AuthSignInWithFacebookRequested>((event, emit) async {
      try {
        emit(const AuthLoading());
        await _authService.signInWithFacebook();
        emit(const AuthAuthenticated());
      } catch (failure) {
        emit(AuthFailure(failure: failure));
      }
        
       }
    });

    on<AuthSignOutRequested>((event, emit) async {
      try {
        emit(const AuthLoading());
        await _authService.signOut();
        emit(const AuthUnauthenticated());
      } catch (failure) {
        emit(AuthFailure(failure: failure));
      } 
        
       }
    });
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

class AuthCreateNewAccountRequested extends AuthEvent {
  final String email;
  final String password;
  const AuthCreateNewAccountRequested(
      {required this.email, required this.password});
}
class AuthForgotPasswordRequested extends AuthEvent {
  final String email;
  const AuthForgotPasswordRequested(
      {required this.email});
}
class AuthVerifyEmailRequested extends AuthEvent {
  const AuthVerifyEmailRequested();
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

class AuthFailure extends AuthState {
  final Object failure;
  const AuthFailure({required this.failure});
    @override
    List<Object?> get props => [failure];
  }
class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}

class AuthAuthenticated extends AuthState {
  const AuthAuthenticated();
}