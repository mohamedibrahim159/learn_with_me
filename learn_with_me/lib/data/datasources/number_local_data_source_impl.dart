import 'number_local_datasource.dart';

class NumberLocalDataSourceImpl implements NumberLocalDataSource {
  @override
  Future<List<Map<String, dynamic>>> getNumbers() async {
    final mockData = List.generate(
      10,
      (index) => {
        'name': (index + 1).toString(),
        'sound': 'number_${index + 1}_sound',
        'image': 'number_${index + 1}.png',
      },
    );
    return Future.value(mockData);
  }
}