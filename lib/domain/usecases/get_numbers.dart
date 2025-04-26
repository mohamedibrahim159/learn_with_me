import 'package:dartz/dartz.dart';

import '../../core/usecases/usecase.dart';
import '../../core/errors/failures.dart';
import '../entities/number.dart';
import '../repositories/number_repository.dart';

class GetNumbers extends UseCase<List<Number>, NoParams> {
  final NumberRepository numberRepository;

  const GetNumbers(this.numberRepository);

  @override
  Future<Either<Failure, List<Number>>> call(NoParams params) async {
    return await numberRepository.getNumbers(params);
  }

}