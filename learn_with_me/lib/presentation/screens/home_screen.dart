import 'package:flutter/material.dart';
import 'package:learn_with_me/core/constants/app_assets.dart';
import 'package:learn_with_me/presentation/routes/app_routes.dart';
import 'package:learn_with_me/presentation/screens/animals_screen.dart';
import 'package:learn_with_me/presentation/screens/letters_screen.dart';
import 'package:learn_with_me/presentation/screens/numbers_screen.dart';
import 'package:learn_with_me/presentation/screens/stories_screen.dart';
import 'package:learn_with_me/presentation/widgets/responsive_widget.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const LettersScreen(),
    const NumbersScreen(),
    const AnimalsScreen(),
    const StoriesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(builder: (context, size) {
      return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.loginBackgroundImage),
                fit: BoxFit.cover,
              ),
            ),
            child: _screens[_selectedIndex],
          ),
           bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.text_fields,
            ),
            label: 'Letters',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.format_list_numbered,
            ),
            label: 'Numbers',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pets,
            ),
            label: 'Animals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Stories',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      );
    });
  }
}