import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:music_app/models/song.dart';

class AudioManager {
  static final AudioManager _instance = AudioManager._internal();

  factory AudioManager() {
    return _instance;
  }

  AudioManager._internal();

  AudioPlayer audioPlayer = AudioPlayer();
}

class SongManager {
  static final SongManager _instance = SongManager._internal();

  factory SongManager() {
    return _instance;
  }

  SongManager._internal();

  final ConcatenatingAudioSource playlist = ConcatenatingAudioSource(children: []);

  int _nextMediaId = 0;

  void addSong(Song song) {
    String singer =
        song.singers.map((singer) => singer.name.toString()).join("+");
        playlist.add(
      AudioSource.uri(
        Uri.parse(song.filePath),
        tag: MediaItem(
          id: '${_nextMediaId++}',
          displaySubtitle: song.lyrics,
          title: song.title,
          artist: singer,
          artUri: Uri.parse(song.image),
        ),
      ),
    );
  }

  AudioSource getSongs() {
    return playlist;
  }

  
}
