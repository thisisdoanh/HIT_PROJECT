import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:music_app/base_widget/function_button.dart';
import 'package:music_app/base_widget/info_song.dart';
import 'package:music_app/const/component.dart';
import 'package:music_app/const/dimen.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/screens/playing/component/api_playing.dart';
import 'package:music_app/screens/playing/component/appbar_playing.dart';
import 'package:rxdart/rxdart.dart';

class PlayMusicScreen extends StatefulWidget {
  const PlayMusicScreen({super.key, this.song});

  final Song? song;

  @override
  State<PlayMusicScreen> createState() => _PlayMusicScreenState();
}

class _PlayMusicScreenState extends State<PlayMusicScreen> {
  late AudioPlayer audioPlayer;

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        audioPlayer.positionStream,
        audioPlayer.bufferedPositionStream,
        audioPlayer.durationStream,
        (positon, bufferedPosition, duration) => PositionData(
          positon,
          bufferedPosition,
          duration ?? Duration.zero,
        ),
      );

  final playlist = ConcatenatingAudioSource(
    children: [],
  );

  @override
  void initState() {
    super.initState();

    audioPlayer = AudioPlayer();

    _init();

    if (widget.song != null) {
      String singer = widget.song!.singers
          .map((singer) => singer.name.toString())
          .join("+");
      playlist.add(
        AudioSource.uri(
          Uri.parse(widget.song!.filePath),
          tag: MediaItem(
            id: '0',
            displaySubtitle: widget.song?.lyrics,
            title: widget.song!.title,
            artist: singer,
            artUri: Uri.parse(widget.song!.image),
          ),
        ),
      );
    }
  }

  Future<void> _init() async {
    // setState(() {});

    await audioPlayer.setAudioSource(playlist);

    await audioPlayer.setLoopMode(LoopMode.all);

    // await audioPlayer.play();

    // await audioPlayer.playerStateStream.listen(
    //   (event) {
    //     print("ngoaif prcessing");
    //     if (event == ProcessingState.completed) {
    //       print("đã vào đây");
    //       setState(() {});
    //     }
    //   },
    // );
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPlaying(),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight - 10,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  StreamBuilder<SequenceState?>(
                    stream: audioPlayer.sequenceStateStream,
                    builder: (context, snapshot) {
                      final state = snapshot.data;
                      if (state?.sequence.isEmpty ?? true) {
                        return const SizedBox();
                      }
                      final mediaData = state!.currentSource?.tag as MediaItem;
                      return SongInfo(
                        imageUrl: mediaData.artUri.toString(),
                        tittle: mediaData.title,
                        artist: mediaData.artist.toString() ?? " ",
                        lyrics: '',
                      );
                    },
                  ),
                  const SizedBox(
                    height: Dimen.sizedBoxMedium,
                  ),
                  StreamBuilder<PositionData>(
                    stream: _positionDataStream,
                    builder: (context, snapshot) {
                      final positionData = snapshot.data;
                      return ProgressBar(
                        progress: positionData?.position ?? Duration.zero,
                        total: positionData?.duration ?? Duration.zero,
                        progressBarColor: const Color.fromRGBO(241, 92, 0, 1),
                        baseBarColor: const Color.fromRGBO(241, 92, 0, 0.3),
                        thumbColor: const Color.fromRGBO(241, 92, 0, 1),
                        onSeek: (duration) {
                          audioPlayer.seek(duration);
                        },
                        onDragEnd: () {
                          audioPlayer.seek(Duration.zero);
                        },
                      );
                    },
                  ),
                  BaseFunctionButton(audioPlayer: audioPlayer),
                  const Spacer(),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          )),
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 50,
                      child: const Center(
                        child: Column(
                          children: [
                            Icon(
                              Icons.arrow_upward_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                            Text(
                              "Music lyrics",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        // isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: SingleChildScrollView(
                              padding: EdgeInsets.all(16),
                              child: Center(
                                child: Text(
                                  widget.song?.lyrics ??
                                      'Hệ thống chưa có lời bài hát!!!',
                                  style: Component.textStyleText,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class PositionData {
  PositionData(
    this.position,
    this.bufferedPosition,
    this.duration,
  );

  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;
}
