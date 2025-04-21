import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_with_me/presentation/blocs/auth_bloc.dart';
import 'package:learn_with_me/presentation/routes/app_routes.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {\n    return BlocListener<AuthBloc, AuthState>(\n      listener: (context, state) {\n        if (state is AuthUnauthenticated) {\n          // Navigate to login screen\n          Navigator.pushReplacementNamed(context, AppRoutes.login);\n        }\n        if (state is AuthFailure) {\n                ScaffoldMessenger.of(context).showSnackBar(\n                SnackBar(content: Text(state.failure.toString())),\n              );\n          }\n      },\n      child: Scaffold(\n        appBar: AppBar(\n          title: const Text('Verify Your Email'),\n        ),\n        body: Center(\n          child: Column(\n            mainAxisAlignment: MainAxisAlignment.center,\n            children: [\n              const Text(\n                  'A verification link has been sent to your email. Please check your email and click on the link to verify your account.'),\n              const SizedBox(height: 20),\n              ElevatedButton(\n                onPressed: () {\n                   context.read<AuthBloc>().add(const AuthVerifyEmailRequested());\n                },\n                child: const Text('Resend Verification Email'),\n              ),\n               const SizedBox(height: 20),\n               ElevatedButton(\n                onPressed: () {\n                   Navigator.pushReplacementNamed(context, AppRoutes.login);\n                },\n                child: const Text('Go to login'),\n              )\n            ],\n          ),\n        ),\n      ),\n    );\n  }\n}\n
  }\n}\n
  
          ),
        ),
      ),
    );
  }
}