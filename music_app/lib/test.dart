import 'package:flutter/material.dart';
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> origin/Doanh
import 'package:just_audio/just_audio.dart';

class FloatingWidget extends StatefulWidget {
  final AudioPlayer audioPlayer;
<<<<<<< HEAD
=======
import 'package:music_app/screens/favorite/component/api_favorite.dart';

import 'models/song.dart';

class Test extends StatefulWidget {
  const Test({super.key});
>>>>>>> 7c0a3036d8e265e9a9f5e30384eec81ed19af0f3
=======
>>>>>>> origin/Doanh

  FloatingWidget({required this.audioPlayer});

  @override
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> origin/Doanh
  _FloatinngWidgetState createState() => _FloatinngWidgetState();
}

class _FloatinngWidgetState extends State<FloatingWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Duration>(
      stream: widget.audioPlayer.positionStream,
      builder: (context, snapshot) {
        final position = snapshot.data;
        final totalDuration = widget.audioPlayer.duration ?? Duration.zero;
        final progress = position?.inMilliseconds.toDouble() ?? 0.0;
        final total = totalDuration.inMilliseconds.toDouble();

        return LinearProgressIndicator(
          value: total != 0 ? progress / total : 0,
          minHeight: 5.0,
          backgroundColor: Colors.grey,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        );
      },
    );
<<<<<<< HEAD
=======
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  static List<Song> songs = [];
  Future<void> fetch() async {
    songs = await ApiFavorite().getFavoriteSong(context);
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
>>>>>>> 7c0a3036d8e265e9a9f5e30384eec81ed19af0f3
=======
>>>>>>> origin/Doanh
  }
}

class SongProgressBar extends StatefulWidget {
  final Duration duration;
  final double progress;
  final ValueChanged<double> onProgressChanged;
  final AudioPlayer audioPlayer;

  SongProgressBar({
    required this.duration,
    required this.progress,
    required this.onProgressChanged,
    required this.audioPlayer,
  });
