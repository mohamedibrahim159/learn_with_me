import '../../core/usecases/usecase.dart';
import '../../core/errors/failures.dart';
import '../entities/number.dart';
import '../repositories/number_repository.dart';

class GetNumbers extends UseCase<List<Number>, NoParams> {
  final NumberRepository numberRepository;

  const GetNumbers(this.numberRepository);

  @override
  Either<Failure, List<Number>> call(NoParams params) {
    return numberRepository.getNumbers();
  }

}