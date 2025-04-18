import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:learn_with_me/core/errors/failures.dart';
import 'package:learn_with_me/presentation/blocs/auth_bloc.dart';
import 'package:learn_with_me/presentation/blocs/auth_state.dart';
import 'package:learn_with_me/presentation/routes/app_routes.dart';
import 'package:learn_with_me/core/constants/app_constants.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key){
    authBloc = GetIt.instance.get<AuthBloc>();
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in'),
      ),
      body: BlocProvider(
          create: (context) => authBloc..add(AuthCheckRequested()),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if(state is AuthSuccess){
                Navigator.pushReplacementNamed(context, AppRoutes.home);
              }
              if(state is AuthFailure){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.failure.message)));
              }
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      obscureText: true,
                    ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.forgotPassword);
                          },
                          child: const Text(AppConstants.forgotPassword),
                        ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        final email = _emailController.text;
                        final password = _passwordController.text;                        if (email.isEmpty || password.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Email and password are required')));
                          return;
                        }

                        authBloc.add(AuthSignInWithEmailAndPasswordRequested(email: email, password: password));
                      },
                      child: const Text('Sign in'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        authBloc.add(AuthSignInWithGoogleRequested());
                      },
                      child: const Text('Sign in with Google'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                       Navigator.pushReplacementNamed(context, AppRoutes.home);
                      },
                      child: const Text('Skip'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        authBloc.add(AuthSignInWithFacebookRequested());
                      },
                      child: const Text('Sign in with Facebook'),
                    ),
                    if (state is AuthLoading)
                      const Center(
                        child: CircularProgressIndicator(),
                      )
                  ],
                ),
              );
            },
          ),
      ),
    );
  }
    late AuthBloc authBloc;
}
