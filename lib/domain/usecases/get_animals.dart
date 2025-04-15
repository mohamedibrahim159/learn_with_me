import 'package:learn_with_me/core/usecases/usecase.dart';

import '../../core/errors/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/animal.dart';
import '../repositories/content_repository.dart';

class GetAnimals extends UseCase<List<Animal>, NoParams> {
  final ContentRepository contentRepository;

  const GetAnimals(this.contentRepository);

  @override
  Either<Failure, List<Animal>> call(NoParams params) {
    return contentRepository.getAnimals();
  }
}