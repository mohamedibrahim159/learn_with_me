import 'package:flutter/material.dart';
import 'package:learn_with_me/config/dependencies.dart';
import 'package:learn_with_me/presentation/blocs/letter_bloc.dart';
import 'package:learn_with_me/presentation/screens/introduction_screen.dart';
import '../../core/services/audio_service.dart';

import '../screens/create_new_account_screen.dart';
import '../screens/age_selection_screen.dart';
import '../screens/create_new_password_screen.dart';
import '../screens/welcome_screen.dart';
import '../screens/parents_screen.dart';
import '../screens/forgot_password_screen.dart';
import '../screens/home_screen.dart';
import '../screens/letters_screen.dart';
import '../screens/gender_selection_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/numbers_screen.dart';
import '../screens/animals_screen.dart';
import '../screens/stories_screen.dart';
import '../screens/login_screen.dart';
import '../screens/verify_email_screen.dart';

class AppRoutes {
    static const String initialRoute = '/gender_selection';

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
  static Map<String, WidgetBuilder> routes = {
    '/welcome': (context) => const WelcomeScreen(),
    login: (context) =>  const LoginScreen(),
    home: (context) =>  const HomeScreen(),
    letters: (context) =>  LettersScreen(audioService: getIt<AudioService>(), letterBloc: getIt<LetterBloc>()),
    numbers: (context) => const NumbersScreen(),
    animals: (context) => const AnimalsScreen(),
    stories: (context) => const StoriesScreen(),
    genderSelection: (context) => const GenderSelectionScreen(),
    ageSelection: (context) => const AgeSelectionScreen(),
    forgotPassword: (context) => const ForgotPasswordScreen(),
    verifyEmail: (context) => const VerifyEmailScreen(),
    createNewPassword: (context) => const CreateNewPasswordScreen(),
    profile: (context) => const ProfileScreen(),
        parents: (context) => const ParentsScreen(),
            createNewAccount: (context) => const CreateNewAccountScreen(),
            introduction: (context) => const IntroductionScreen(),
  };
}