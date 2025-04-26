import 'package:learn_with_me/core/usecases/usecase.dart';

import '../../core/errors/failures.dart';
import '../entities/animal.dart';
import '../repositories/content_repository.dart';

class GetAnimals extends UseCase<List<Animal>, NoParams> {
  final ContentRepository contentRepository;

  const GetAnimals(this.contentRepository);

  @override
  Future<Either<Failure, List<Animal>>> call(NoParams params) async {
    return await contentRepository.getAnimals();
  }
}