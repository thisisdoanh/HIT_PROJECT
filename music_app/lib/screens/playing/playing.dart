// ignore_for_file: avoid_print, await_only_futures

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:music_app/base_widget/function_button.dart';
import 'package:music_app/base_widget/image.dart';
import 'package:music_app/base_widget/info_song.dart';
import 'package:music_app/base_widget/seekbar.dart';
import 'package:music_app/const/component.dart';
import 'package:music_app/controller.dart';
import 'package:music_app/models/playlist.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/screens/playing/component/appbar_playing.dart';
import 'package:music_app/test.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class PlayMusicScreen extends StatefulWidget {
  const PlayMusicScreen({
    super.key,
  });

  @override
  State<PlayMusicScreen> createState() => _PlayMusicScreenState();
}

class _PlayMusicScreenState extends State<PlayMusicScreen> {
  static int _nextMediaId = 0;
  late AudioPlayer audioPlayer;

  Song? song;

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
      // AudioSource.uri(
      //   Uri.parse(
      //       "https://res.cloudinary.com/dzlxu2dlv/video/upload/v1690228330/Music-Player-App/Audio/wg8q0hgfilva4z2ddwgm.mp3"),
      //   tag: MediaItem(
      //     id: '${_nextMediaId++}',
      //     displaySubtitle: "Hệ thống chưa có lời bài hát",
      //     title: "Nơi này có anh",
      //     artist: "Sơn Tùng MTP",
      //     artUri: Uri.parse(
      //         "https://res.cloudinary.com/dzlxu2dlv/image/upload/v1690211874/Music-Player-App/Image/mowtyybask7uomwrpdct.jpg"),
      //   ),
      // ),
      // AudioSource.uri(
      //   Uri.parse(
      //       "https://res.cloudinary.com/dzlxu2dlv/video/upload/v1690296792/Music-Player-App/Audio/dwyfzf1xqvyereyrd9jv.mp3"),
      //   tag: MediaItem(
      //     id: '${_nextMediaId++}',
      //     displaySubtitle: "Hệ thống chưa có lời bài hát",
      //     title: "Ánh Nắng Của Anh",
      //     artist: "Đức Phúc",
      //     artUri: Uri.parse(
      //         "https://res.cloudinary.com/dzlxu2dlv/image/upload/v1690211374/Music-Player-App/Image/rofk28spmvx4pwl0yn7h.jpg"),
      //   ),
      // ),
      // AudioSource.uri(
      //   Uri.parse(
      //       "https://res.cloudinary.com/dzlxu2dlv/video/upload/v1690296041/Music-Player-App/Audio/x2j6ts6akdvrwibqpwaf.mp3"),
      //   tag: MediaItem(
      //     id: '${_nextMediaId++}',
      //     displaySubtitle: "Hệ thống chưa có lời bài hát",
      //     title: "Rời Bỏ",
      //     artist: "Hòa Minzy",
      //     artUri: Uri.parse(
      //         "https://res.cloudinary.com/dzlxu2dlv/image/upload/v1690212267/Music-Player-App/Image/fnx7bbvlawadfcdazz9k.jpg"),
      //   ),
      // ),
      // AudioSource.uri(
      //   Uri.parse(
      //       "https://res.cloudinary.com/dzlxu2dlv/video/upload/v1690298124/Music-Player-App/Audio/jbl07lhdzb5rqwizk14i.mp3"),
      //   tag: MediaItem(
      //     id: '${_nextMediaId++}',
      //     displaySubtitle: "Hệ thống chưa có lời bài hát",
      //     title: "Cause I Love You",
      //     artist: "Noo Phước Thịnh",
      //     artUri: Uri.parse(
      //         "https://res.cloudinary.com/dzlxu2dlv/image/upload/v1690211722/Music-Player-App/Image/lgzvmzpg1gwdomcqt8qm.jpg"),
      //   ),
      // ),
      // AudioSource.uri(
      //   Uri.parse(
      //       "https://res.cloudinary.com/dzlxu2dlv/video/upload/v1690299324/Music-Player-App/Audio/jteuop1nmylbdxrtzg7y.mp3"),
      //   tag: MediaItem(
      //     id: '${_nextMediaId++}',
      //     displaySubtitle: "Hệ thống chưa có lời bài hát",
      //     title: "Người Theo Đuổi Ánh Sáng",
      //     artist: "Uông Tô Lang",
      //     artUri: Uri.parse(
      //         "https://res.cloudinary.com/dzlxu2dlv/image/upload/v1690212477/Music-Player-App/Image/jbu7br800kxsfptknelc.jpg"),
      //   ),
      // ),
    ],
  );

  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   audioPlayer = Provider.of<Controller>(context, listen: false).audioPlayer;
    //   print("vào 1");
    //   // song = ModalRoute.of(context)?.settings.arguments as Song?;
    // });
    // audioPlayer = AudioPlayer();
    // print(audioPlayer);
    AudioManager audioManager = AudioManager();
    audioPlayer = audioManager.audioPlayer;

    _init();

    super.initState();
  }

  Future<dynamic> _init() async {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   // await Future.delayed(Duration(milliseconds: 10));
    //   audioPlayer =
    //       Provider.of<Controller>(context, listen: false).audioPlayer!;
    //   print(audioPlayer);
    //   // await controller.i; // Khởi tạo audioPlayer trong controller

    //   // audioPlayer = controller.audioPlayer!;
    // });
    // await Fu
    // await Future.delayed(
    //   Duration(milliseconds: 10),
    // );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      song = ModalRoute.of(context)?.settings.arguments as Song?;
    });
    // await Future.delayed(Duration(seconds: 2));
    // print("vào 2");

    // final playlistSong = songManager.getSongs();
    SongManager songManager = SongManager();
    ConcatenatingAudioSource playlistSong = songManager.playlist;

    await Future.delayed(Duration.zero, () async {
      print(playlistSong.runtimeType);

      print("object");
      // print("vào 3");
      if (song != null || playlistSong != null) {
        songManager.addSong(song!);
        playlistSong = songManager.playlist;

        print(playlistSong.length);
        print("object1");
        audioPlayer.playbackEventStream.listen(
          (event) {
            print("Vào envent");
            if (event.processingState == ProcessingState.completed) {
              print("Vào Processing");
              Random rd = Random();
              audioPlayer.seek(Duration.zero,
                  index: rd.nextInt(playlistSong.length - 1));
              audioPlayer.play();
            }
          },
          onError: (Object e, StackTrace stackTrace) {
            print('A stream error occurred: $e');
          },
        );

        try {
          await audioPlayer.setAudioSource(playlistSong);
          audioPlayer.seek(Duration.zero, index: playlistSong.length - 1);
          audioPlayer.play();
        } catch (e, stackTrace) {
          // Catch load errors: 404, invalid url ...
          print("Error loading playlist: $e");
          print(stackTrace);
        }
      }
    });
    // setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    // audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final Song? song = ModalRoute.of(context)?.settings.arguments as Song?;
    return Scaffold(
      appBar: const AppBarPlaying(),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                        artist: mediaData.artist.toString(),
                        lyrics: '',
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CupertinoButton(
                        padding: const EdgeInsets.all(0),
                        child: const Icon(
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
                            padding: const EdgeInsets.all(0),
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
                        padding: const EdgeInsets.all(0),
                        child:
                            const Icon(Icons.menu_rounded, color: Colors.white),
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
                    onPressed: () async {
                      AudioSource audioSource = playlist.sequence.last;
                      OverlayEntry overlayEntry;
                      overlayEntry = OverlayEntry(
                        builder: (context) => Positioned(
                          top: MediaQuery.of(context).size.height * 0.9,
                          child: Material(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.amber,
                              child: Column(
                                children: [
                                  // CupertinoButton(
                                  //   child: Icon(Icons.delete),
                                  //   onPressed: () {},
                                  // ),

                                  FloatinngWidget(
                                    audioPlayer: audioPlayer,
                                  ),

                                  // Text('Hello'),
                                  // Text('data'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );

                      Overlay.of(context).insert(overlayEntry);
                      await Future.delayed(Duration(
                        seconds: 5,
                      ));
                      // overlayEntry.remove();
                      showModalBottomSheet(
                        // isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.all(16),
                              child: Center(
                                child: Text(
                                  song?.lyrics ??
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
