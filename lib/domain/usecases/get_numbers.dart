import 'package:dartz/dartz.dart';
import 'package:learn_with_me/core/errors/failures.dart';
import 'package:learn_with_me/core/usecases/usecase.dart';
import 'package:learn_with_me/domain/entities/number.dart';
import 'package:learn_with_me/domain/repositories/number_repository.dart';


class GetNumbers extends UseCase<List<Number>, NoParams> {
  final NumberRepository numberRepository;

  const GetNumbers(this.numberRepository);

  @override
  Future<Either<Failure, List<Number>>> call(NoParams params) async {
    return await numberRepository.getNumbers(params);
  }

}