import 'package:flutter/material.dart';

import 'package:learn_with_me/presentation/routes/app_routes.dart';
import 'package:learn_with_me/presentation/widgets/responsive_widget.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(builder: (context, size) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'A verification link has been sent to your email. Please check your email and click on the link to verify your account.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.login);
                },
                child: const Text('Go to login'),
              )
            ],
            ),
          ),
        ),
      );
    });
  }
}