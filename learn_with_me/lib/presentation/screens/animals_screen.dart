import 'package:flutter/material.dart';
import 'package:learn_with_me/core/constants/app_assets.dart';

class AnimalsScreen extends StatelessWidget {
  const AnimalsScreen({super.key});
  final List<Map<String, String>> animals = const [
    {'name': 'Cat', 'image': AppAssets.logoPath},
    {'name': 'Dog', 'image': AppAssets.logoPath},
    {'name': 'Elephant', 'image': AppAssets.logoPath},
    {'name': 'Lion', 'image': AppAssets.logoPath},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animals'),
      ),
      body: ListView.builder(
        itemCount: animals.length,
        itemBuilder: (context, index) {
          final animal = animals[index];
          return ListTile(
            leading: Image.asset(
              animal['image']!,
              width: 50,
              height: 50,
            ),
            title: Text(animal['name']!),
          );
        },
      ),
    );
  }
}