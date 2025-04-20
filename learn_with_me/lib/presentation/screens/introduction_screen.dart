import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Introduction'),
        ),
          child: const Text('Continue'),
        ),
      ),
    );
  }
}