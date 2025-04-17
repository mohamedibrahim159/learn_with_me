import 'package:flutter/material.dart';
import 'package:learn_with_me/core/constants/app_assets.dart';

class LettersScreen extends StatelessWidget {
  const LettersScreen({super.key});
  final List<Map<String, String>> letters = const [
    {'name': 'A', 'image': AppAssets.logoPath},
    {'name': 'B', 'image': AppAssets.logoPath},
    {'name': 'C', 'image': AppAssets.logoPath},
    {'name': 'D', 'image': AppAssets.logoPath},
    {'name': 'E', 'image': AppAssets.logoPath},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Letters Screen'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: letters.length,
        itemBuilder: (context, index) {
          final letter = letters[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.asset(
                letter['image']!,
                width: 50,
                height: 50,
              ),
              title: Text(
                letter['name']!,
              ),
            ),
          );
        },
      ),
    );
  }
}