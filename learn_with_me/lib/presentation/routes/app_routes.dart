import 'package:flutter/material.dart';
import '../screens/home_screen.dart'; // Import HomeScreen
import '../screens/letters_screen.dart'; // Import LettersScreen
import '../screens/numbers_screen.dart'; // Import NumbersScreen
import '../screens/animals_screen.dart'; // Import AnimalsScreen
import '../screens/colors_screen.dart'; // Import ColorsScreen
import '../screens/stories_screen.dart'; // Import StoriesScreen
import '../screens/login_screen.dart'; // Import LoginScreen

class AppRoutes {
  static const String initialRoute = '/login'; // Define initial route
  static const String home = '/home';
  static Map<String, WidgetBuilder> routes = { // Define routes map
    home: (context) => const HomeScreen(), // Route for HomeScreen
    '/letters': (context) => const LettersScreen(), // Route for LettersScreen
    '/numbers': (context) => const NumbersScreen(), // Route for NumbersScreen
    '/animals': (context) => const AnimalsScreen(), // Route for AnimalsScreen
    '/colors': (context) => const ColorsScreen(), // Route for ColorsScreen
    '/stories': (context) => const StoriesScreen(), // Route for StoriesScreen
    '/login': (context) => const LoginScreen(), // Route for LoginScreen
  };
}