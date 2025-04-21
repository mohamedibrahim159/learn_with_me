import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_with_me/core/constants/app_assets.dart';
import 'package:learn_with_me/core/constants/app_colors.dart';
import 'package:learn_with_me/core/errors/failures.dart';
import 'package:learn_with_me/presentation/blocs/auth_bloc.dart';
import 'package:learn_with_me/presentation/routes/app_routes.dart';
import 'package:learn_with_me/core/constants/app_constants.dart';
import 'package:learn_with_me/presentation/widgets/responsive_widget.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool _passwordVisible = false;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(builder: (context, size) {
      return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
               Navigator.pushReplacementNamed(context, AppRoutes.home);
          }
          if (state is AuthFailure) {
            final failure = state.failure;
            if (failure is Failure) {
                ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(failure.message)),
              );
            } else{
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(failure.toString())),
              );
            }
            
          }
        },
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.loginBackgroundImage),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: size.height * 0.05, left: size.width * 0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              fixedSize: Size(size.width * 0.2, size.height * 0.05)),
                          onPressed: () {
                            // Handle back button press
                          },
                          child: const Text(
                            'Back',
                            style: TextStyle(color: Colors.black, fontFamily: 'Viga'),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              fixedSize: Size(size.width * 0.2, size.height * 0.05)),
                          onPressed: () {
                             Navigator.pushReplacementNamed(context, AppRoutes.home);
                          },
                          child: const Text(
                            'Skip',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: size.height * 0.1),
                      child: Text(
                        'Hello!',
                        style: TextStyle(
                          fontFamily: 'Viga',
                          fontSize: size.width * 0.1,
                          color: const Color(0xFFFFC107),
                        ),
                      ),
                    ],
                  ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.05, bottom: size.height * 0.05),
                    child: Text(
                      'Register to get started',
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: size.height * 0.03),
                      child: TextField(
                        maxLines: 1,
                        controller: _usernameController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(
                              Icons.person,
                              color: AppColors.primaryColor,
                            ),
                            hintText: 'Username',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            fixedSize: Size(size.width * 0.9, size.height * 0.07)),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: size.height * 0.03),
                      child: TextField(
                        controller: _passwordController,
                        maxLines: 1,
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: AppColors.primaryColor,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(_passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                            hintText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            fixedSize: Size(size.width * 0.9, size.height * 0.07)),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: size.height * 0.03),
                      child: TextField(
                        maxLines: 1,
                        controller: _emailController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: const Icon(
                            Icons.email,
                            color: AppColors.primaryColor,
                          ),
                          hintText: 'Email',
                          fixedSize: Size(size.width * 0.9, size.height * 0.07),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.02,left: size.width*0.05),
                  child: Row(
                    children:  [
                      Switch(
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value;
                          });
                        },
                      ),
                      const Text(
                        'Remember me',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: size.height * 0.03,bottom: size.height*0.03),
                    child: ElevatedButton(
                      onPressed: () {
                         context.read<AuthBloc>().add(
                                AuthSignInWithEmailAndPasswordRequested(
                                  email: _emailController.text,
                                  password: _passwordController.text),
                            );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        fixedSize: Size(size.width * 0.9, size.height * 0.07),
                      ),
                      child: const Text(
                        'Register',
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                ), Center(child: TextButton(onPressed: (){Navigator.pushNamed(context, AppRoutes.forgotPassword);}, child: const Text("forgot password?"))
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: size.height * 0.02,bottom: size.height*0.02),
                    child:  Text(
                      '- or login with -',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: size.height*0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            context
                                .read<AuthBloc>()
                                .add(const AuthSignInWithGoogleRequested());
                          },
                          icon: Image.asset(
                            AppAssets.googleIcon,
                            height: size.height * 0.03,
                          ),
                          label: const Text('Google'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            fixedSize: Size(size.width * 0.4, size.height * 0.06),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            context
                                .read<AuthBloc>()
                                .add(const AuthSignInWithFacebookRequested());
                          },
                          icon: Image.asset(
                            AppAssets.facebookIcon,
                            height: size.height * 0.03,
                          ),
                          label: const Text('Facebook'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            fixedSize: Size(size.width * 0.4, size.height*0.06),
                          ),
                        ),
                      ],
                    ),
                  ),
                ), TextButton(onPressed: (){Navigator.pushNamed(context, AppRoutes.createNewAccount);}, child: const Text("create new account")),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
