import 'package:learn_with_me/data/datasources/mock_data.dart';
import 'package:learn_with_me/data/models/number_model.dart';
import 'number_local_datasource.dart';

class NumberLocalDataSourceImpl implements NumberLocalDataSource {
  @override
  Future<List<NumberModel>> getNumbers() async {
    return mockNumbers;
  }
}