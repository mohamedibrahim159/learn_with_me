import 'package:learn_with_me/core/errors/failures.dart';

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {    
    case ServerFailure:
      return 'Server Failure';
    case CacheFailure:
      return 'Cache Failure';
    default: return 'Unexpected Error';
  }
}