import 'package:flutter/material.dart';
import 'package:learn_with_me/core/constants/app_assets.dart';
import 'package:learn_with_me/domain/entities/animal.dart';

class AnimalsScreen extends StatefulWidget {
  const AnimalsScreen({super.key});





  @override
  State<AnimalsScreen> createState() => _AnimalsScreenState();
}

class _AnimalsScreenState extends State<AnimalsScreen> {
  final List<Animal> animals = []; // Placeholder list

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.loginBackgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Adjust the number of columns as needed
          ),
          itemCount: animals.length,
          itemBuilder: (context, index) {
            return _buildAnimalItem(animals[index]);
          },
        ),
      ),
    );
  }

  Widget _buildAnimalItem(Animal animal) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Placeholder for image
          const Icon(Icons.image, size: 50),
          // Placeholder for audio icon
          IconButton(
            icon: const Icon(Icons.volume_up),
            onPressed: () {
              // TODO: Implement audio playback from API
            },
          ),
        ],
      ),
    );
  }
}
