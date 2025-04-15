import 'package:flutter/material.dart';
import 'package:learn_with_me/core/constants/app_assets.dart';

class StoriesScreen extends StatelessWidget {
  const StoriesScreen({super.key});
  final List<Map<String, String>> stories = const [
    {'name': 'Story 1', 'image': AppAssets.storyImagePath},
    {'name': 'Story 2', 'image': AppAssets.storyImagePath},
    {'name': 'Story 3', 'image': AppAssets.storyImagePath},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stories Screen'),
      ),
      body: ListView.builder(
        itemCount: stories.length,
        itemBuilder: (context, index) {
          final story = stories[index];
          return ListTile(
            leading: Image.asset(
              story['image']!,
              width: 50,
              height: 50,
            ),
            title: Text(story['name']!),
          );
        },
      ),
    );
  }
}