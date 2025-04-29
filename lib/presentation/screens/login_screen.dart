import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_with_me/core/constants/app_colors.dart';
import 'package:learn_with_me/core/errors/failure.dart';
import 'package:learn_with_me/presentation/blocs/auth/auth_bloc.dart';
import 'package:learn_with_me/presentation/blocs/auth/auth_event.dart';
import 'package:learn_with_me/presentation/blocs/auth/auth_state.dart';
import 'package:learn_with_me/core/constants/app_assets.dart';
import 'package:learn_with_me/presentation/routes/app_routes.dart';
import 'package:learn_with_me/presentation/widgets/responsive_widget.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  // final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool _passwordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(failure.toString())),
              );
            }
          }          
        },
        child: Scaffold( body: SingleChildScrollView(
              child: Form(
                key: _formKey,
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
                           Navigator.of(context).pop();
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
                            Navigator.pushReplacementNamed(
                                context, AppRoutes.home);
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
                      child:  Text(
                        'Hello!',
                        style: TextStyle(
                          fontFamily: 'Viga',
                          fontSize: size.width * 0.1,
                          color:  Color(0xFFFFC107),
                        ),
                      ),
                    ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.05, bottom: size.height * 0.04),
                      child:  Text(
                        'Register to get started',
                        style:  TextStyle(
                          fontSize: size.width * 0.04,
                          color: Colors.white,
                        ),
                      ),
                    ),                  
                    child: Padding(
                      padding:  EdgeInsets.only(bottom: size.height * 0.03),
                    ),
                  ),
                  Center(
                      padding: EdgeInsets.only(bottom: size.height * 0.03),
                      child: TextField(
                        controller: _passwordController,
                         obscureText: !_passwordVisible,
                        decoration:  InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: AppColors.primaryColor,
                            ), 
                            
                            hintText: 'Password',
                             
                            suffixIcon: IconButton(
                              icon: Icon(_passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility_off),
                              onPressed: () {
                                 setState((){
                                  _passwordVisible = !_passwordVisible;
                                 });
                              },
                            ),
                             
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }else if(value.length<6){
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                        
                      ),),
                     
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: size.height * 0.03),
                      child: TextFormField(
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
                          )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!value.contains('@')) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                ),
              ),Padding(padding: EdgeInsets.only(top: size.height * 0.02,left: size.width*0.05),
                  ),
                Center(child:
                        Text(
                        'Remember me',
                        style: TextStyle(color: Colors.white),
                      ),
                    
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: size.height * 0.03,bottom: size.height*0.03),
                    
                    child: ElevatedButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()){

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
                        'Login',
                        style: TextStyle(color: AppColors.primaryColor),
                      ),}
                    ),
                  ),),
                ), Center(child: TextButton(onPressed: (){Navigator.pushNamed(context, AppRoutes.forgotPassword);}, child: const Text("forgot password?"))
                  ),),
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
                  ),), TextButton(onPressed: (){Navigator.pushNamed(context, AppRoutes.createNewAccount);}, child: const Text("create new account")),
                ],
              ),
            ),
              ),
          ),
        ),
      );
    });
  }
}

