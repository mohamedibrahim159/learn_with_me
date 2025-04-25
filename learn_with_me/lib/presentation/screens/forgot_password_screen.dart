import 'package:flutter/material.dart';
import 'package:learn_with_me/core/constants/app_assets.dart';
import 'package:learn_with_me/presentation/widgets/responsive_widget.dart';
import 'package:learn_with_me/presentation/routes/app_routes.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {return ResponsiveWidget(
      builder: (context, size) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.loginBackgroundImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                 Padding(
                    padding: EdgeInsets.only(
                        top: size.height * 0.05, left: size.width * 0.04),
                    child: Row(
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
                      ],
                    ),
                  ),
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
          ),
        );
      },
    );
  }

  void _sendResetLink(String email, BuildContext context) {
     if (email.isNotEmpty){
        // Add your logic here to send reset link
      } else {
         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("please enter your email!"),
        ));
    }
  }
}