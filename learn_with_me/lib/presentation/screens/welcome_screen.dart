import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    _checkFirstTimeAndLogin();
  }

  void _checkFirstTimeAndLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isFirstTime) {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    } else {
      if (isLoggedIn) {
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.login);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF67C3F3),
              Color(0xFF59B4F3),
              Color(0xFF55A8F4),
            ],
          ),
        ), 
        child: Center(child: CircularProgressIndicator(color: Colors.white,)
        
          ),
        ),
      ),
    );
  }
}