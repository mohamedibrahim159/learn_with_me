import 'package:learn_with_me/data/datasources/letter_local_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:learn_with_me/core/errors/failures.dart';
import 'package:learn_with_me/core/usecases/usecase.dart';
import 'package:learn_with_me/data/models/letter_model.dart';
import 'package:learn_with_me/domain/entities/letter.dart';
import 'package:learn_with_me/domain/repositories/letter_repository.dart';

class LetterRepositoryImpl implements LetterRepository {
  final LetterLocalDataSource letterLocalDataSource;

  LetterRepositoryImpl({required this.letterLocalDataSource});

  @override
  Future<Either<Failure, List<Letter>>> getLetters(NoParams params) async {
    try {
      final result = await letterLocalDataSource.getLetters();    
      final letters = result.map((letterModel) => letterModel.toEntity()).toList();
      return Right(letters);
    } on Exception {
      return Left(ServerFailure(message: 'Server error'));
    }
  }
}