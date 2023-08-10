import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/base_widget/seekbar.dart';
import 'package:rxdart/rxdart.dart';

class FloatinngWidget extends StatefulWidget {
  const FloatinngWidget({Key? key, required this.audioPlayer})
      : super(key: key);
  final AudioPlayer audioPlayer;

  @override
  State<FloatinngWidget> createState() => _FloatinngWidgetState();
}

class _FloatinngWidgetState extends State<FloatinngWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Duration>(
      stream: widget.audioPlayer.positionStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final position = snapshot.data!;
          final totalDuration = widget.audioPlayer.duration ?? Duration.zero;
          final progress = position.inMilliseconds.toDouble();
          final total = totalDuration.inMilliseconds.toDouble();

          return LinearProgressIndicator(
            value: progress / total ?? 0,
            minHeight: 5.0,
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          );
        } else {
          return LinearProgressIndicator(
            value: 0.0,
            minHeight: 5.0,
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          );
        }
      },
    );
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

  @override
  _SongProgressBarState createState() => _SongProgressBarState();
}

class _SongProgressBarState extends State<SongProgressBar> {
  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: widget.progress,
      minHeight: 10,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.white10),
    );
  }
}
