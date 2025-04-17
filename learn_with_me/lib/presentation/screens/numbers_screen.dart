import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';

class NumbersScreen extends StatelessWidget {
  const NumbersScreen({super.key});
  final List<Map<String, String>> numbers = const [
    {'name': 'One', 'image': AppAssets.logoPath},
    {'name': 'Two', 'image': AppAssets.logoPath},
    {'name': 'Three', 'image': AppAssets.logoPath},
    {'name': 'Four', 'image': AppAssets.logoPath},
    {'name': 'Five', 'image': AppAssets.logoPath},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Numbers'),
      ),
      body: ListView.builder(
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(
              numbers[index]['image']!,
              width: 50,
            ),
            title: Text(numbers[index]['name']!),
          );
        },
      ),
    );
  }
}