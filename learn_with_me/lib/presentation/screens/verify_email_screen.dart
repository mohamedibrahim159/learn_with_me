import 'package:flutter/material.dart';
import 'package:learn_with_me/presentation/routes/app_routes.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Verify Your Email'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Verify your email'),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                   Navigator.pushReplacementNamed(context, AppRoutes.createNewPassword);
                },
                child: const Text('Verify'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}