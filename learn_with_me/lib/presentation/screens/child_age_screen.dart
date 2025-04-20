import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../routes/app_routes.dart';

class ChildAgeScreen extends StatefulWidget {
  const ChildAgeScreen({super.key});

  @override
  State<ChildAgeScreen> createState() => _ChildAgeScreenState();
}

class _ChildAgeScreenState extends State<ChildAgeScreen> {
  String _selectedAge = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            const Text(
              'What age is your child ?',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                _selectedAge = '4 - 5 years';
                GetIt.I.registerSingleton<String>(_selectedAge,instanceName: 'childAge');
                Navigator.pushNamed(context, AppRoutes.introduction);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff48a8a6),
                minimumSize: const Size(320, 50),
                padding: const EdgeInsets.all(5),
              ),
              child: const Text(
                '4 - 5 years',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _selectedAge = '6 - 7 years';
                GetIt.I.registerSingleton<String>(_selectedAge,instanceName: 'childAge');
                Navigator.pushNamed(context, AppRoutes.introduction);
              },
              child: const Text('6 - 7 years'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _selectedAge = '7 - 8 years';
                GetIt.I.registerSingleton<String>(_selectedAge,instanceName: 'childAge');
                Navigator.pushNamed(context, AppRoutes.introduction);
              },
              child: const Text('7 - 8 years'),
            ),
          ],
        ),
      ),
    );
  }
}