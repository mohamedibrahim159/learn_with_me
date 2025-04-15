import 'dart:convert';

import 'number_local_datasource.dart';

class NumberLocalDataSourceImpl implements NumberLocalDataSource {
  @override
  Future<List<Map<String, dynamic>>> getNumbers() async {
    final mockData = [
      {'name': 'One', 'sound': 'one_sound', 'image': 'one_image.png'},
      {'name': 'Two', 'sound': 'two_sound', 'image': 'two_image.png'},
      {'name': 'Three', 'sound': 'three_sound', 'image': 'three_image.png'},
      {'name': 'Four', 'sound': 'four_sound', 'image': 'four_image.png'},
      {'name': 'Five', 'sound': 'five_sound', 'image': 'five_image.png'},
      {'name': 'Six', 'sound': 'six_sound', 'image': 'six_image.png'},
      {'name': 'Seven', 'sound': 'seven_sound', 'image': 'seven_image.png'},
      {'name': 'Eight', 'sound': 'eight_sound', 'image': 'eight_image.png'},
      {'name': 'Nine', 'sound': 'nine_sound', 'image': 'nine_image.png'},
      {'name': 'Ten', 'sound': 'ten_sound', 'image': 'ten_image.png'},
    ];
    return Future.value(mockData);
  }
}