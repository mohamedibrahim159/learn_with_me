import 'package:flutter/material.dart';
import 'package:learn_with_me/app/l10n/app_localizations.dart';
import 'package:learn_with_me/core/constants/app_assets.dart';
import 'package:learn_with_me/core/constants/app_colors.dart';
import 'package:learn_with_me/core/constants/app_constants.dart';
import 'package:learn_with_me/presentation/widgets/responsive_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final List<Map<String, dynamic>> _sections = [
    {
      'title': 'Letters',
      'image': AppAssets.logoPath,
      'route': '/letters',
    },
    {
      'title': 'Numbers',
      'image': AppAssets.logoPath,
      'route': '/numbers',
    },
    {
      'title': 'Animals',
      'image': AppAssets.logoPath,
      'route': '/animals',
    },
    {
      'title': 'Colors',
      'image': AppAssets.logoPath,
      'route': '/colors',
    },
    {
      'title': 'Stories',
      'image': AppAssets.storyImagePath,
      'route': '/stories',
    },
    {
      'title': 'Login',
      'image': AppAssets.storyImagePath,
      'route': '/login',
    },
  ];

  void _navigateToSection(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.appName),
      ),
      body: ResponsiveWidget(
        mobileWidget: ListView.builder(
          itemCount: _sections.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image(image: AssetImage(_sections[index]['image'])),
              title: Text(AppLocalizations.of(context)!.translate(_sections[index]['title'])),
              onTap: () => _navigateToSection(context, _sections[index]['route']),
            );
          },
        ),
        tabletWidget: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
          ),
          itemCount: _sections.length,
          itemBuilder: (context, index) {
            return ElevatedButton(
              onPressed: () => _navigateToSection(
                  context, _sections[index]['route']),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondaryColor,
                foregroundColor: AppColors.primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(_sections[index]['image']),
                    width: 50,
                    height: 50,
                  ),
                   Text(AppLocalizations.of(context)!.translate(_sections[index]['title'])),
                ],
              ),
            );
          },
        ),
        desktopWidget: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.5,
          ),
          itemCount: _sections.length,
          itemBuilder: (context, index) {
            return ElevatedButton(
              onPressed: () => _navigateToSection(context, _sections[index]['route']),
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondaryColor,
                  foregroundColor: AppColors.primaryColor),
              child: Column(children: [
                Image(image: AssetImage(_sections[index]['image'])),
                 Text(AppLocalizations.of(context)!.translate(_sections[index]['title'])),
              ]),
            );
          },
        ),
      ),
    );
  }
}