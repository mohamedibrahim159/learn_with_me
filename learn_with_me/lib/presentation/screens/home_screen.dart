import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to the home screen'),
            ElevatedButton(
              onPressed: () {
                print('logout');
              },
              child: const Text('logout'),
            ),
          ],
        ),
              ),
    );
  }
}