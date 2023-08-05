import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:music_app/base_widget/function_button.dart';
import 'package:music_app/base_widget/info_song.dart';
import 'package:music_app/base_widget/seekbar.dart';
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
  static int _nextMediaId = 0;
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
    children: [
      AudioSource.uri(
        Uri.parse(
            "https://res.cloudinary.com/dzlxu2dlv/video/upload/v1690228330/Music-Player-App/Audio/wg8q0hgfilva4z2ddwgm.mp3"),
        tag: MediaItem(
          id: '${_nextMediaId++}',
          artist: "Sơn Tùng MTP",
          title: "Nơi này có anh",
          artUri: Uri.parse(
              "https://res.cloudinary.com/dzlxu2dlv/image/upload/v1690211874/Music-Player-App/Image/mowtyybask7uomwrpdct.jpg"),
        ),
      ),
      AudioSource.uri(
        Uri.parse(
            "https://res.cloudinary.com/dzlxu2dlv/video/upload/v1690296463/Music-Player-App/Audio/s9stlaiqelyyldpzebwc.mp3"),
        tag: MediaItem(
          id: '${_nextMediaId++}',
          artist: "Hoà Minzy",
          title: "Không Thể Cùng Nhau Suốt Kiếp",
          artUri: Uri.parse(
              "https://res.cloudinary.com/dzlxu2dlv/image/upload/v1690212267/Music-Player-App/Image/fnx7bbvlawadfcdazz9k.jpg"),
        ),
      ),
      AudioSource.uri(
        Uri.parse(
            "https://res.cloudinary.com/dzlxu2dlv/video/upload/v1690306767/Music-Player-App/Audio/pjibqgsdjyxg4v7amtix.mp3"),
        tag: MediaItem(
          id: '${_nextMediaId++}',
          artist: "Alan Walker",
          title: "On My Way",
          artUri: Uri.parse(
              "https://res.cloudinary.com/dzlxu2dlv/image/upload/v1690213261/Music-Player-App/Image/swdam75ew7fbye5huwvs.jpg"),
        ),
      ),
    ],
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
            id: '${_nextMediaId++}',
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

    audioPlayer.playbackEventStream.listen(
      (event) {},
      onError: (Object e, StackTrace stackTrace) {
        print('A stream error occurred: $e');
      },
    );

    try {
      await audioPlayer.setAudioSource(playlist);
    } catch (e, stackTrace) {
      // Catch load errors: 404, invalid url ...
      print("Error loading playlist: $e");
      print(stackTrace);
    }
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CupertinoButton(
                        padding: EdgeInsets.all(0),
                        child: Icon(
                          Icons.download_rounded,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                      StreamBuilder<LoopMode>(
                        stream: audioPlayer.loopModeStream,
                        builder: (context, snapshot) {
                          final loopMode = snapshot.data ?? LoopMode.off;
                          const icons = [
                            Icon(
                              Icons.repeat_rounded,
                              color: Colors.orange,
                            ),
                            Icon(
                              Icons.repeat_one_rounded,
                              color: Colors.orange,
                            ),
                            Icon(
                              Icons.repeat_rounded,
                              color: Colors.white,
                            ),
                          ];
                          const repeatMode = [
                            LoopMode.all,
                            LoopMode.one,
                            LoopMode.off,
                          ];

                          final index = repeatMode.indexOf(loopMode);

                          return CupertinoButton(
                            padding: EdgeInsets.all(0),
                            child: icons[index],
                            onPressed: () {
                              audioPlayer.setLoopMode(repeatMode[
                                  (repeatMode.indexOf(loopMode) + 1) %
                                      repeatMode.length]);
                            },
                          );
                        },
                      ),
                      CupertinoButton(
                        padding: EdgeInsets.all(0),
                        child: Icon(Icons.menu_rounded, color: Colors.white),
                        onPressed: () {},
                      ),
                      StreamBuilder<bool>(
                        stream: audioPlayer.shuffleModeEnabledStream,
                        builder: (context, snapshot) {
                          final shuffleModeEnabled = snapshot.data ?? false;
                          return CupertinoButton(
                            padding: const EdgeInsets.all(0),
                            child: shuffleModeEnabled == true
                                ? const Icon(
                                    Icons.shuffle_rounded,
                                    color: Colors.orange,
                                  )
                                : const Icon(
                                    Icons.shuffle_rounded,
                                    color: Colors.white,
                                  ),
                            onPressed: () async {
                              final enable = !shuffleModeEnabled;
                              if (enable) {
                                await audioPlayer.shuffle;
                              }
                              await audioPlayer.setShuffleModeEnabled(enable);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  StreamBuilder<PositionData>(
                    stream: _positionDataStream,
                    builder: (context, snapshot) {
                      final positionData = snapshot.data;
                      return SeekBar(
                        duration: positionData?.duration ?? Duration.zero,
                        position: positionData?.position ?? Duration.zero,
                        bufferedPosition:
                            positionData?.bufferedPosition ?? Duration.zero,
                        onChangeEnd: (newPosition) {
                          audioPlayer.seek(newPosition);
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
