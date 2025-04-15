abstract class ContentLocalDataSource {
  Future<List<Map<String, dynamic>>> getAnimals();
  Future<List<Map<String, dynamic>>> getColors();
  Future<List<Map<String, dynamic>>> getStories();
}