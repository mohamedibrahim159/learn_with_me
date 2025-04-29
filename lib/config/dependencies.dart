import 'package:get_it/get_it.dart';
import 'package:learn_with_me/core/services/api_service.dart';
import 'package:learn_with_me/data/datasources/auth_local_datasource.dart';
import 'package:learn_with_me/core/services/audio_service.dart';
import 'package:learn_with_me/core/services/http_service.dart';
import 'package:learn_with_me/data/repositories/letter_repository_impl.dart';
import 'package:learn_with_me/data/repositories/number_repository_impl.dart';
import 'package:learn_with_me/data/repositories/user_repository_impl.dart';
import 'package:learn_with_me/domain/repositories/letter_repository.dart';
import 'package:learn_with_me/domain/repositories/number_repository.dart';
import 'package:learn_with_me/data/datasources/content_local_datasource.dart';
import 'package:learn_with_me/data/datasources/letter_local_datasource.dart';
import 'package:learn_with_me/data/datasources/number_local_datasource.dart';
import 'package:learn_with_me/data/datasources/user_local_datasource.dart';
import 'package:learn_with_me/data/repositories/content_repository_impl.dart';
import 'package:learn_with_me/domain/repositories/content_repository.dart';
import 'package:learn_with_me/domain/usecases/get_stories.dart';
import 'package:learn_with_me/domain/repositories/user_repository.dart';
import 'package:learn_with_me/domain/usecases/get_animals.dart';
import 'package:learn_with_me/domain/usecases/get_letters.dart';
import 'package:learn_with_me/domain/usecases/get_numbers.dart';
import 'package:learn_with_me/presentation/blocs/animal_bloc.dart';
import 'package:learn_with_me/presentation/blocs/letter_bloc.dart';
import 'package:learn_with_me/presentation/blocs/number_bloc.dart';

final GetIt getIt = GetIt.instance;

void configureDependencies() {

  getIt.registerLazySingleton<String>(() => ""); //gender
  getIt.registerLazySingleton<int>(() => 0); //age

  // Services
  getIt.registerLazySingleton<HttpService>(() => HttpService());
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt()));

  getIt.registerLazySingleton<AudioService>(() => AudioService());

  // DataSources
  getIt.registerLazySingleton<LetterLocalDataSource>(
      () => LetterLocalDataSourceImpl());
  getIt.registerLazySingleton<NumberLocalDataSource>(

  // Repositories  
  getIt.registerLazySingleton<LetterRepository>(
      () => LetterRepositoryImpl(getIt()));
  getIt.registerLazySingleton<NumberRepository>(
      () => NumberRepositoryImpl(getIt()));
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(getIt()));

  // Use Cases
  getIt.registerLazySingleton<GetLetters>(() => GetLetters(getIt()));
  getIt.registerLazySingleton<GetNumbers>(() => GetNumbers(getIt()));
  getIt.registerLazySingleton<GetAnimals>(() => GetAnimals(getIt()));

  // Blocs
  getIt.registerFactory<LetterBloc>(() => LetterBloc(getIt()));
  getIt.registerFactory<NumberBloc>(() => NumberBloc(getIt()));
  getIt.registerFactory<AnimalBloc>(() => AnimalBloc(getIt()));
  getIt.registerFactory(() => AuthBloc(getIt()));
}