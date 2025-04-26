import 'package:audioplayers/audioplayers.dart';

class AudioService {
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> playAudio(String audioPath) async {
    await _audioPlayer.play(UrlSource(audioPath));
  }

  void dispose() {
    _audioPlayer.dispose();
  }
}