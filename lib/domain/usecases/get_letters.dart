import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/letter.dart';
import '../repositories/letter_repository.dart';

class GetLetters extends UseCase<List<Letter>, NoParams> {
  final LetterRepository letterRepository;

  const GetLetters(this.letterRepository);

    @override
  Future<Either<Failure, List<Letter>>> call(NoParams params) async {
    return  await letterRepository.getLetters(params);
  }
}