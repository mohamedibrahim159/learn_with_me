import 'package:flutter/material.dart';
import 'package:learn_with_me/config/dependencies.dart';
import 'package:learn_with_me/presentation/routes/app_routes.dart';
import 'package:learn_with_me/domain/usecases/authenticate_user.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
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
    );
  }

  final TextEditingController _emailController = TextEditingController();

  void _sendResetLink(String email, BuildContext context) async {
    final authenticateUserUseCase = getIt<AuthenticateUser>();

    // TODO: Implement forgot password logic
    // await authenticateUserUseCase.sendPasswordResetEmail(email).then((value) => {
    //       Navigator.pushReplacementNamed(
    //         context,
    //         AppRoutes.verifyEmail,
    //       ),
    //     });
  }
}