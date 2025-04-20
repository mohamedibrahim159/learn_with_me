import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:learn_with_me/core/services/audio_service.dart';
import 'package:learn_with_me/app/configure_dependencies.dart';
import 'package:learn_with_me/core/services/firebase_service.dart';
import 'package:learn_with_me/presentation/blocs/animal_bloc.dart';
import 'package:learn_with_me/presentation/blocs/auth_bloc.dart';
import 'package:learn_with_me/presentation/blocs/content_bloc.dart';
import 'package:learn_with_me/presentation/blocs/letter_bloc.dart';
import 'package:learn_with_me/presentation/blocs/number_bloc.dart';
import 'package:learn_with_me/presentation/blocs/story_bloc.dart';
import 'package:learn_with_me/presentation/routes/app_routes.dart';

final GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FirebaseService.initialize();
  await configureDependencies();
  getIt.registerSingleton<AudioService>(AudioService()); 
  getIt.registerFactory(() => AuthBloc(
        authService: getIt(),
        authenticateUserUseCase: getIt(),
      ));
  getIt.registerFactory(() => LetterBloc(getLetters: getIt()));
  getIt.registerFactory(() => StoryBloc(getStories: getIt()));
  getIt.registerFactory(() => NumberBloc(getNumbersUseCase: getIt()));
   getIt.registerFactory(() => ContentBloc(getContentsUseCase: getIt()));
  getIt.registerFactory(() => AnimalBloc(getAnimals: getIt()));
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => getIt<AuthBloc>(),
        ),
        BlocProvider<LetterBloc>(
          create: (context) => getIt<LetterBloc>(),
        ),
        BlocProvider<StoryBloc>(
          create: (context) => getIt<StoryBloc>(),
        ),
        BlocProvider<NumberBloc>(
          create: (context) => getIt<NumberBloc>(),
        ),
        BlocProvider<ContentBloc>(
          create: (context) => getIt<ContentBloc>(),
        ),
        BlocProvider<AnimalBloc>(
          create: (context) => getIt<AnimalBloc>(),
        ),
      ],
      child: const MaterialApp(
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.routes,
        
      ),
    );
  }
}

