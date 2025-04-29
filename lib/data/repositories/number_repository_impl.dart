import 'package:dartz/dartz.dart';
import 'package:learn_with_me/core/errors/failures.dart';
import 'package:learn_with_me/core/usecases/usecase.dart';
import 'package:learn_with_me/data/datasources/number_local_datasource.dart';
import 'package:learn_with_me/data/models/number_model.dart';
import 'package:learn_with_me/domain/entities/number.dart';
import 'package:learn_with_me/domain/repositories/number_repository.dart';

class NumberRepositoryImpl implements NumberRepository {
  final NumberLocalDataSource numberLocalDataSource;

  NumberRepositoryImpl({required this.numberLocalDataSource});

  @override
  Future<Either<Failure, List<Number>>> getNumbers(NoParams params) async {
    try {
      final result = await numberLocalDataSource.getNumbers();
      final numbers = result.map((e) => e.toEntity()).toList();
      return Right(numbers);
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}