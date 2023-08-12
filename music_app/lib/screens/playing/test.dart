import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class TestPlayer extends StatelessWidget {
  const TestPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Music App'),
      ),
      body: Column(
        children: [
          // Các thành phần UI khác trong body
          Expanded(
            child: Container(),
          ),
          const MusicPlayerBar(),
        ],
      ),
    );
  }
}

class MusicPlayerBar extends StatelessWidget {
  const MusicPlayerBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MusicPlayerState>(
      builder: (context, musicPlayerState, _) {
        return Container(
          color: Colors.grey[200],
          child: Row(
            children: [
              IconButton(
                icon: Icon(musicPlayerState.isPlaying
                    ? Icons.pause
                    : Icons.play_arrow),
                onPressed: () {
                  if (musicPlayerState.isPlaying) {
                    musicPlayerState.pause();
                  } else {
                    musicPlayerState.play();
                  }
                },
              ),
              // Các thành phần khác của thanh nghe nhạc
            ],
          ),
        );
      },
    );
  }
}

class MusicPlayerState extends ChangeNotifier {
  bool isPlaying = false;

  void play() {
    isPlaying = true;
    notifyListeners();
  }

  void pause() {
    isPlaying = false;
    notifyListeners();
  }
}
