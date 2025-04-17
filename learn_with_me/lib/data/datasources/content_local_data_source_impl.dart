import 'package:learn_with_me/data/datasources/content_local_datasource.dart';

class ContentLocalDataSourceImpl implements ContentLocalDataSource {
  @override
  Future<List<Map<String, dynamic>>> getAnimals() async {
    return [
      {'name': 'Lion', 'sound': 'Roar', 'image': 'lion.png'},
      {'name': 'Elephant', 'sound': 'Trumpet', 'image': 'elephant.png'},
      {'name': 'Monkey', 'sound': 'Ooh Ooh Ah Ah', 'image': 'monkey.png'},
      {'name': 'Tiger', 'sound': 'Growl', 'image': 'tiger.png'},
      {'name': 'Zebra', 'sound': 'Bray', 'image': 'zebra.png'},
    ];
  }

  @override
  Future<List<Map<String, dynamic>>> getColors() async {
    return [
      {'name': 'Red', 'sound': 'Red Sound', 'image': 'red.png'},
      {'name': 'Blue', 'sound': 'Blue Sound', 'image': 'blue.png'},
      {'name': 'Green', 'sound': 'Green Sound', 'image': 'green.png'},
      {'name': 'Yellow', 'sound': 'Yellow Sound', 'image': 'yellow.png'},
      {'name': 'Purple', 'sound': 'Purple Sound', 'image': 'purple.png'},
    ];
  }

  @override
  Future<List<Map<String, dynamic>>> getStories() async {
    return [
      {
        'name': 'The Tortoise and the Hare',
        'sound': 'Story Sound',
        'image': 'tortoise_hare.png',
        'content': 'Once upon a time...'
      },
      {
        'name': 'The Boy Who Cried Wolf',
        'sound': 'Story Sound',
        'image': 'cried_wolf.png',
        'content': 'There once was a boy...'
      },
            {
        'name': 'Cinderella',
        'sound': 'Story Sound',
        'image': 'cinderella.png',
        'content': 'Once upon a time in a faraway land, there was a young woman named Cinderella...'
      },
    ];
  }
}