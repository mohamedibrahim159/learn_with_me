import 'package:flutter/material.dart';

class AnimalsScreen extends StatelessWidget {
  const AnimalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animals Screen'),
      ),
      body: const Center(
        child: Text('Animals Screen'),
      ),
    );
  }
}