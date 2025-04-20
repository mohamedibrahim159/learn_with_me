import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:learn_with_me/presentation/blocs/auth_bloc.dart';
import 'package:learn_with_me/presentation/routes/app_routes.dart';
import 'package:learn_with_me/core/constants/app_constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isFormValid = false;

  void _validateForm() {
    setState(() {
      isFormValid = _formKey.currentState?.validate() ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = GetIt.instance.get<AuthBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in'),
      ),
      body: BlocProvider(
        create: (context) => authBloc,
        child: Form(
          key: _formKey,
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthAuthenticated) {
                Navigator.pushReplacementNamed(
                    context, AppRoutes.genderSelection);
              }
              if (state is AuthFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.failure is ServerFailure
                          ? (state.failure as ServerFailure).message
                          : "unexpected error",
                    ),
                  ),
                );
              }
            },
            builder: (context, state) {
              final isloading = state is AuthLoading;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      controller: _emailController,
                      onChanged: (_) => _validateForm(),
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                        controller: _passwordController,
                        onChanged: (_) => _validateForm(),
                        decoration: const InputDecoration(
                          labelText: 'Password',
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          if (value.length < 6) {
                            return "Password must be at least 6 characters";
                          }
                          return null;
                        }),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, AppRoutes.forgotPassword);
                      },
                      child: const Text(AppConstants.forgotPassword),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: isloading
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                final email = _emailController.text.trim();
                                final password = _passwordController.text.trim();

                                if (!RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(email)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("Invalid email")));
                                  return;
                                }

                                authBloc.add(
                                    AuthSignInWithEmailAndPasswordRequested(
                                        email: email, password: password));
                              }
                            },
                      child: const Text('Sign in'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: isloading
                          ? null
                          : () {
                              authBloc.add(AuthSignInWithGoogleRequested());
                            },
                      child: const Text('Sign in with Google'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: isloading
                          ? null
                          : () {
                              Navigator.pushReplacementNamed(
                                  context, AppRoutes.home);
                            },
                      child: const Text('Skip'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: isloading
                          ? null
                          : () {
                              authBloc.add(AuthSignInWithFacebookRequested());
                            },
                      child: const Text('Sign in with Facebook'),
                    ),
                    if (state is AuthLoading)
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
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
                         authBloc.add(const AuthCheckRequested());
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
}
