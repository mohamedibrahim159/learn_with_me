import 'package:flutter/material.dart';
import 'package:learn_with_me/core/constants/app_assets.dart';
import 'package:learn_with_me/core/constants/app_colors.dart';
import 'package:learn_with_me/core/constants/app_constants.dart';
import 'package:learn_with_me/presentation/screens/animals_screen.dart';

import 'package:learn_with_me/presentation/screens/letters_screen.dart';
import 'package:learn_with_me/presentation/screens/numbers_screen.dart';
import 'package:learn_with_me/presentation/screens/stories_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static final List<Widget> _pages = <Widget>[
    const LettersScreen(),
    const NumbersScreen(),
    const AnimalsScreen(),
    const StoriesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text(AppConstants.appName),
        ),
        body: _pages.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(AppAssets.logoPath),
              ),
              label: 'Letters',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(AppAssets.logoPath),
              ),
              label: 'Numbers',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(AppAssets.logoPath),
              ),
              label: 'Animals',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(AppAssets.storyImagePath),
              ),
              label: 'Stories',
          ),
        
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Stories',
          ),
        ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.secondaryColor,
          showUnselectedLabels: true,
          onTap: _onItemTapped,
        ));
    
    );
  }
}