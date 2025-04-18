import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AgeSelectionScreen extends StatefulWidget {
  const AgeSelectionScreen({super.key});

  @override
  State<AgeSelectionScreen> createState() => _AgeSelectionScreenState();
}

class _AgeSelectionScreenState extends State<AgeSelectionScreen> {
  final GetIt getIt = GetIt.instance;
  int? _selectedAge;

  List<int> ages = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Your Age'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Select your age'),
            const SizedBox(height: 20),
            DropdownButton<int>(
              value: _selectedAge,
              items: ages.map((int age) {
                return DropdownMenuItem<int>(
                  value: age,
                  child: Text('$age'),
                );
              }).toList(),
              onChanged: (int? newValue) {
                setState(() {
                  _selectedAge = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_selectedAge != null) {
                  getIt.registerSingleton<int>(_selectedAge!);
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("You must select an age")));
                }
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}