import '../models/number_model.dart';

abstract class NumberLocalDataSource {
  Future<List<NumberModel>> getNumbers();
}