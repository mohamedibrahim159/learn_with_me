import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_with_me/core/errors/failures.dart';
import 'package:learn_with_me/presentation/blocs/auth_bloc.dart';
import 'package:learn_with_me/config/dependencies.dart';
import 'package:learn_with_me/presentation/routes/app_routes.dart';
import 'package:learn_with_me/domain/usecases/authenticate_user.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});
  
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthUnauthenticated) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Password reset link sent. Check your email.'),
            ),
          );
           Navigator.pushReplacementNamed(context, AppRoutes.login);
        }
        if (state is AuthFailure) {
          final failure = state.failure;
            if (failure is Failure) {
                ScaffoldMessenger.of(context).showSnackBar(\n                SnackBar(content: Text(failure.message)),\n              );\n            } else{\n              ScaffoldMessenger.of(context).showSnackBar(\n                SnackBar(content: Text(failure.toString())),\n              );\n            }\n        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Forgot Password'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Enter your email',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  _sendResetLink(_emailController.text, context);
                },
                child: const Text('Send Reset Link'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _sendResetLink(String email, BuildContext context) {
     if (email.isNotEmpty){
      context.read<AuthBloc>().add(AuthForgotPasswordRequested(email: email));
    } else {
         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("please enter your email!"),
        ));
    }
  }
}