import 'package:flutter/material.dart';
import 'package:learn_with_me/core/services/audio_service.dart';
import 'package:learn_with_me/config/dependencies.dart';
import 'package:learn_with_me/presentation/screens/age_selection_screen.dart';
import 'package:learn_with_me/presentation/screens/animals_screen.dart';
import 'package:learn_with_me/presentation/screens/create_new_account_screen.dart';
import 'package:learn_with_me/presentation/screens/create_new_password_screen.dart';
import 'package:learn_with_me/presentation/screens/forgot_password_screen.dart';
import 'package:learn_with_me/presentation/screens/gender_selection_screen.dart';
import 'package:learn_with_me/presentation/screens/home_screen.dart';
import 'package:learn_with_me/presentation/screens/introduction_screen.dart';
import 'package:learn_with_me/presentation/screens/letters_screen.dart';
import 'package:learn_with_me/presentation/screens/login_screen.dart';
import 'package:learn_with_me/presentation/screens/numbers_screen.dart';
import 'package:learn_with_me/presentation/screens/parents_screen.dart';
import 'package:learn_with_me/presentation/screens/profile_screen.dart';
import 'package:learn_with_me/presentation/screens/splash_screen.dart';
import 'package:learn_with_me/presentation/screens/stories_screen.dart';
import 'package:learn_with_me/presentation/screens/verify_email_screen.dart';
import 'package:learn_with_me/presentation/screens/welcome_screen.dart';

class AppRoutes {
    static const String initialRoute = '/splash';
    static const String splash = '/splash';
    
  static const String welcome = '/welcome';
  static const String letters = '/letters';
  static const String numbers = '/numbers';
  static const String animals = '/animals';
  static const String stories = '/stories';
  static const String home = '/home';
  static const String login = '/login';
  static const String genderSelection = '/gender_selection';
  static const String ageSelection = '/age_selection';
  static const String forgotPassword = '/forgot_password';
  static const String verifyEmail = '/verify_email';
  static const String createNewPassword = '/create_new_password';
  static const String profile = '/profile';
  static const String parents = '/parents';
  static const String introduction = '/introduction';
  static const String createNewAccount = '/create_new_account';
  static final Map<String, WidgetBuilder> routes = {
    splash: (context) =>  const SplashScreen(),
    welcome: (context) => const  WelcomeScreen(),
    login: (context) =>  const LoginScreen(),
    home: (context) => const  HomeScreen(),
    letters: (context) =>   LettersScreen(audioService: getIt<AudioService>(),),
    numbers: (context) =>  const NumbersScreen(),
    animals: (context) =>  const AnimalsScreen(),
    stories: (context) =>  const StoriesScreen(),
    genderSelection: (context) => const GenderSelectionScreen(),
    ageSelection: (context) => const AgeSelectionScreen(),
    forgotPassword: (context) => const ForgotPasswordScreen(),
    verifyEmail: (context) =>  const VerifyEmailScreen(),
    createNewPassword: (context) =>  const CreateNewPasswordScreen(),
    profile: (context) =>  const ProfileScreen(),
    parents: (context) => const  ParentsScreen(),
    createNewAccount: (context) => const  CreateNewAccountScreen(),
    introduction: (context) => const IntroductionScreen(),
        
  };
}