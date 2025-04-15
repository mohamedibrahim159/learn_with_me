import 'package:flutter/material.dart';

class LettersScreen extends StatelessWidget {
  const LettersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Letters Screen'),
      ),
      body: const Center(
        child: Text('Letters Screen'),
      ),
    );
  }
}