import 'package:flutter/material.dart';
import 'package:learn_with_me/config/dependencies.dart';
import 'package:learn_with_me/core/services/auth_service.dart';
import 'package:learn_with_me/presentation/routes/app_routes.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                controller: TextEditingController(),
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                  final authService = getIt<AuthService>();
                   authService.sendPasswordResetEmail("test@test.com").then((value) => {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.verifyEmail,
                      ),
                    });
                // TODO: Implement forgot password logic
              },
              child: const Text('Send Reset Link'),
            ),
          ],
        ),
      ),
    );
  }
}