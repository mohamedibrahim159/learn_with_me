import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_with_me/presentation/blocs/auth_bloc.dart';
import 'package:learn_with_me/presentation/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthUnauthenticated) {
          _navigateToLogin(context);
        }
        _handleAuthState(state, context);
      },
      child: _buildHomeContent(context),
    );
  }

  void _handleAuthState(AuthState state, BuildContext context){
    if (state is AuthUnauthenticated) {
        _navigateToLogin(context);
        if (state is AuthFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Error: ${state.error}")));
        }
      },
      child: Scaffold(
        appBar: AppBar(


  }

  void _navigateToLogin(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.login,
      (route) => false,
    );
  }

  Widget _buildHomeContent(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body: Center(
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Welcome to the home screen'),
                  ElevatedButton(
                    onPressed: state is AuthLoading
                        ? null
                        : () {
                            context
                                .read<AuthBloc>()
                                .add(AuthSignOutRequested());
                          },
                    child: state is AuthLoading ? const CircularProgressIndicator() : const Text('logout'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}