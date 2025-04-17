import 'package:flutter/material.dart';
import 'package:learn_with_me/core/services/firebase_service.dart';
import 'package:learn_with_me/presentation/routes/app_routes.dart';
import 'package:learn_with_me/presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await FirebaseService.initialize();
    runApp(const MyApp());
  }

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        routes: AppRoutes.routes,
        initialRoute: AppRoutes.initialRoute,
        home: const HomeScreen(),
      );
    }
  }