import 'package:learn_with_me/data/datasources/letter_local_datasource.dart';

class LetterLocalDataSourceImpl implements LetterLocalDataSource {
  @override
  Future<List<Map<String, dynamic>>> getLetters() async {
    return [
      {'name': 'A', 'sound': 'a.mp3', 'image': 'a.png'},
      {'name': 'B', 'sound': 'b.mp3', 'image': 'b.png'},
      {'name': 'C', 'sound': 'c.mp3', 'image': 'c.png'},
      {'name': 'D', 'sound': 'd.mp3', 'image': 'd.png'},
       {'name': 'E', 'sound': 'e.mp3', 'image': 'e.png'},
      {'name': 'F', 'sound': 'f.mp3', 'image': 'f.png'},
      {'name': 'G', 'sound': 'g.mp3', 'image': 'g.png'},
      {'name': 'H', 'sound': 'h.mp3', 'image': 'h.png'},
       {'name': 'I', 'sound': 'i.mp3', 'image': 'i.png'},
      {'name': 'J', 'sound': 'j.mp3', 'image': 'j.png'},
      {'name': 'K', 'sound': 'k.mp3', 'image': 'k.png'},
      {'name': 'L', 'sound': 'l.mp3', 'image': 'l.png'},
       {'name': 'M', 'sound': 'm.mp3', 'image': 'm.png'},
      {'name': 'N', 'sound': 'n.mp3', 'image': 'n.png'},
      {'name': 'O', 'sound': 'o.mp3', 'image': 'o.png'},
      {'name': 'P', 'sound': 'p.mp3', 'image': 'p.png'},
       {'name': 'Q', 'sound': 'q.mp3', 'image': 'q.png'},
      {'name': 'R', 'sound': 'r.mp3', 'image': 'r.png'},
      {'name': 'S', 'sound': 's.mp3', 'image': 's.png'},
      {'name': 'T', 'sound': 't.mp3', 'image': 't.png'},
       {'name': 'U', 'sound': 'u.mp3', 'image': 'u.png'},
      {'name': 'V', 'sound': 'v.mp3', 'image': 'v.png'},
      {'name': 'W', 'sound': 'w.mp3', 'image': 'w.png'},
      {'name': 'X', 'sound': 'x.mp3', 'image': 'x.png'},
       {'name': 'Y', 'sound': 'y.mp3', 'image': 'y.png'},
      {'name': 'Z', 'sound': 'z.mp3', 'image': 'z.png'},
    ];
  }
}