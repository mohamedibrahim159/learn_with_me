import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_with_me/core/constants/app_colors.dart';
import 'package:learn_with_me/presentation/blocs/auth_bloc.dart';
import 'package:learn_with_me/presentation/routes/app_routes.dart';
import 'package:learn_with_me/presentation/widgets/responsive_widget.dart';

class CreateNewAccountScreen extends StatefulWidget {
  const CreateNewAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateNewAccountScreen> createState() => _CreateNewAccountScreenState();
}

class _CreateNewAccountScreenState extends State<CreateNewAccountScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
        builder: (context, size) {
      return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
             Navigator.pushReplacementNamed(context, AppRoutes.verifyEmail);
          }
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.failure.toString())),
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Create New Account'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.email,color: AppColors.primaryColor,),                      hintText: 'Email',
                     border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.lock,color: AppColors.primaryColor,),
                    suffixIcon: IconButton(
                        icon: Icon(_passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        }),
                    hintText: 'Password',
                     border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _confirmPasswordController,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.lock,color: AppColors.primaryColor,),
                      hintText: 'Confirm Password',
                       border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                      ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_passwordController.text ==
                        _confirmPasswordController.text) {
                      context.read<AuthBloc>().add(
                          AuthCreateNewAccountRequested(
                              email: _emailController.text,
                              password: _passwordController.text));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                                "Password and Confirm password isn't matched")),
                      );
                    }
                  },
                  child: const Text('Create Account'),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}