import 'package:flutter/material.dart';
import 'package:learn_with_me/core/constants/app_colors.dart';
import 'package:get_it/get_it.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final getIt = GetIt.instance;
    final String? selectedAge = getIt.get<String?>(instanceName: 'childAge');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (selectedAge != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Selected Age: $selectedAge',style: const TextStyle(fontSize: 16),),
                  const SizedBox(width: 8),
                  const Icon(Icons.check_circle, color: Colors.green),
                ],
              )
            else
            const Text("No age selected")
          ],
        ),
      ),
    );
  }
}