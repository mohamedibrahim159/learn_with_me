import 'package:learn_with_me/core/usecases/usecase.dart';

import '../../core/errors/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/color.dart';
import '../repositories/content_repository.dart';

class GetColors extends UseCase<List<Color>, NoParams> {
  final ContentRepository contentRepository;

  const GetColors(this.contentRepository);

  @override
  Either<Failure, List<Color>> call(NoParams params) {
    return contentRepository.getColors();
  }
}