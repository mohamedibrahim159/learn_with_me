import 'package:dartz/dartz.dart';

import '../../core/usecases/usecase.dart';
import '../../core/errors/failures.dart';
import '../entities/story.dart';
import '../repositories/content_repository.dart';

class GetStories extends UseCase<List<Story>, NoParams> {
  final ContentRepository contentRepository;

  GetStories(this.contentRepository);

  @override
  Future<Either<Failure, List<Story>>> call(NoParams params) async {
    return await contentRepository.getStories();
  }

}