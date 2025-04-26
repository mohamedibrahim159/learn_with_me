import 'package:learn_with_me/data/datasources/letter_local_datasource.dart';
import 'package:learn_with_me/data/datasources/mock_data.dart';
import 'package:learn_with_me/data/models/letter_model.dart';

class LetterLocalDataSourceImpl implements LetterLocalDataSource {
  @override
  Future<List<LetterModel>> getLetters() async {
    return mockLetters;
  }
}