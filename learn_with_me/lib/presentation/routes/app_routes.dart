import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/letters_screen.dart';
import '../screens/numbers_screen.dart';
import '../screens/animals_screen.dart';
import '../screens/stories_screen.dart';
import '../screens/login_screen.dart';

class AppRoutes {
  static const String initialRoute = '/login';
  static const String home = '/home';
  static Map<String, WidgetBuilder> routes = {
    '/login': (context) => const LoginScreen(),
    home: (context) => const HomeScreen(),
    '/letters': (context) => const LettersScreen(),
    '/numbers': (context) => const NumbersScreen(),
    '/animals': (context) => const AnimalsScreen(),
    '/stories': (context) => const StoriesScreen(),
  };
}