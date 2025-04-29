import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:learn_with_me/presentation/blocs/auth_bloc.dart';
import 'package:learn_with_me/lib/config/dependencies.dart';
import 'package:learn_with_me/presentation/blocs/animal_bloc.dart';
import 'package:learn_with_me/presentation/blocs/letter_bloc.dart';
import 'package:learn_with_me/presentation/blocs/number_bloc.dart';
import 'package:learn_with_me/domain/usecases/authenticate_user.dart';
import 'package:learn_with_me/core/services/audio_service.dart';
import 'package:learn_with_me/presentation/blocs/story_bloc.dart';
import 'package:learn_with_me/presentation/routes/app_routes.dart';

final GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await configureDependencies();
  getIt.registerSingleton<AudioService>(AudioService());
  getIt.registerFactory(() => LetterBloc(getLetters: getIt()));
  getIt.registerFactory(() => StoryBloc(getStories: getIt()));
  getIt.registerFactory(() => NumberBloc(getNumbersUseCase: getIt()));
  getIt.registerFactory(() => AnimalBloc(getAnimals: getIt()));
  getIt.registerFactory(() => AuthBloc(signInWithEmailAndPasswordUseCase: getIt(),signInWithGoogleUseCase: getIt(),signInWithFacebookUseCase: getIt()));

  runApp(MyApp());
}
  WidgetsFlutterBinding.ensureInitialized();

   await configureDependencies();
   getIt.registerSingleton<AudioService>(AudioService());

   getIt.registerFactory(() => LetterBloc(getLetters: getIt()));
   getIt.registerFactory(() => StoryBloc(getStories: getIt()));
   getIt.registerFactory(() => NumberBloc(getNumbersUseCase: getIt()));
   getIt.registerFactory(() => AnimalBloc(getAnimals: getIt()));
   getIt.registerFactory(() => AuthBloc(signInWithEmailAndPasswordUseCase: getIt(),signInWithGoogleUseCase: getIt(),signInWithFacebookUseCase: getIt()));


    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? firstTime = prefs.getBool('first_time');
    bool? isLoggedIn = prefs.getBool('isLoggedIn');

    String initialRoute;
    if (firstTime == null || firstTime == true) {
        initialRoute = AppRoutes.createNewAccount;
      await prefs.setBool('first_time', false);
      
    } else {
      if(isLoggedIn==null || isLoggedIn == false){
         initialRoute = AppRoutes.createNewAccount;
      }
       else{
          initialRoute = AppRoutes.home;
       }
    }
      runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LetterBloc>(
          create: (context) => getIt<LetterBloc>(),
        ),
        BlocProvider<StoryBloc>(
          create: (context) => getIt<StoryBloc>(),
        ),
        BlocProvider<NumberBloc>(
          create: (context) => getIt<NumberBloc>(),
        ),
        BlocProvider<AnimalBloc>(
          create: (context) => getIt<AnimalBloc>(),
        ),
         BlocProvider<AuthBloc>(
           create: (context) => getIt<AuthBloc>(),
         )
      ],
      child: MaterialApp(
        initialRoute: initialRoute,

        routes: AppRoutes.routes,
      )
    );
  }

}

