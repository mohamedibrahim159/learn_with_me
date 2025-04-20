import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class GenderSelectionScreen extends StatefulWidget {
  const GenderSelectionScreen({super.key});

  @override
  State<GenderSelectionScreen> createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  String? selectedGender;

  void _selectGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gender Selection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedGender == 'boy' ? Colors.blue : null,
              ),
              onPressed: () {
                _selectGender('boy');
              },
              child: const Text('Boy'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedGender == 'girl' ? Colors.pink : null,
              ),
              onPressed: () {
                _selectGender('girl');
              },
              child: const Text('Girl'),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: selectedGender != null
                  ? () {
                      Navigator.pushNamed(
                          context, AppRoutes.ageSelection);
                    }
                  : null,
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}