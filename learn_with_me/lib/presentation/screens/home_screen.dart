import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_with_me/presentation/blocs/auth_bloc.dart';
import 'package:learn_with_me/presentation/screens/animals_screen.dart';
import 'package:learn_with_me/presentation/screens/letters_screen.dart';
import 'package:learn_with_me/presentation/screens/numbers_screen.dart';
import 'package:learn_with_me/presentation/screens/stories_screen.dart';
import 'package:learn_with_me/presentation/routes/app_routes.dart';

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
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthUnauthenticated) {
          _navigateToLogin(context);
        }
        _handleAuthState(state, context);
      },
      child: _buildHomeContent(context),
    );
  }

  void _navigateToLogin(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.login,
      (route) => false,
    );
  }

  void _handleAuthState(AuthState state, BuildContext context) {
    if (state is AuthUnauthenticated) {
      _navigateToLogin(context);
    }
    if (state is AuthFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${state.error}")));
    }
  }

  Widget _buildHomeContent(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen'),
        leading: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.learners);
          },
          child: const Text("Learners"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.parents);
            },
            child: const Text("For Parents"),
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.text_fields),
            label: 'Letters',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_numbered),
            label: 'Numbers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
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
      ),
    );
  }
}