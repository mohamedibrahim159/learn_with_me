import 'package:flutter/material.dart';
import 'package:learn_with_me/presentation/widgets/responsive_widget.dart';

class StoriesScreen extends StatelessWidget {
  const StoriesScreen({super.key});

  @override Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ResponsiveWidget(
          mobileWidget: Padding(
            padding: const EdgeInsets.all(10.0),
            child: _buildGrid(crossAxisCount: 1),
          ),
          tabletWidget: Padding(
            padding: const EdgeInsets.all(20.0),
            child: _buildGrid(crossAxisCount: 2),
          ),
          desktopWidget: Padding(
            padding: const EdgeInsets.all(20.0),
            child: _buildGrid(crossAxisCount: 3),
          ),
        ),
      ),
    );
  }

  Widget _buildGrid({required int crossAxisCount}) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return _buildItem();
      },
    );
  }

  Widget _buildItem() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white.withOpacity(0.8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.image, size: 50),
            SizedBox(height: 10),
            Icon(Icons.volume_up),
          ],
        ),
      ),
    );
  }
}