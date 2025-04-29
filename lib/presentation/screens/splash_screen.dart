import 'package:flutter/material.dart';
import 'package:learn_with_me/core/constants/app_assets.dart';

import 'package:learn_with_me/presentation/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the Welcome screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.welcome);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.splashBackgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: const Image(image: AssetImage(AppAssets.appLogo)),
        ),
      ),
    );
  }
}