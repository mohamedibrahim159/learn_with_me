import '../models/letter_model.dart';

abstract class LetterLocalDataSource {
  Future<List<LetterModel>> getLetters();
}