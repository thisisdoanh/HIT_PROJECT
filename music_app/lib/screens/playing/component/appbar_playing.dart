import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/base_widget/appbar.dart';
import 'package:music_app/base_widget/image.dart';
import 'package:music_app/const/dimen.dart';
import 'package:music_app/controller.dart';
import 'package:music_app/screens/playing/test.dart';

import '../../../models/song.dart';
import '../../../test.dart';

class AppBarPlaying extends StatelessWidget implements PreferredSizeWidget {
  const AppBarPlaying({super.key, required this.song});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  final Song song;

  @override
  Widget build(BuildContext context) {
    return BaseAppbar(
      title: 'Play',
      leading: Icons.arrow_back_sharp,
      functionLeading: () async {
        SongManager songManager = SongManager();
        AudioPlayer audioPlayer = AudioManager().audioPlayer;
        OverlayEntry overlayEntry;
        overlayEntry = OverlayEntry(
          builder: (context) => Positioned(
            top: MediaQuery.of(context).size.height * 0.7,
            child: Material(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width,
                color: Colors.amber,
                child: Column(
                  children: [
                    FloatingWidget(
                      audioPlayer: audioPlayer,
                    ),
                    Row(
                      children: [
                        BaseImageNetwork(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.height * 0.05,
                          linkImage: song.image,
                          borderRadius: 8,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );

        Overlay.of(context).insert(overlayEntry);
        Navigator.pop(context);
        await Future.delayed(
            Duration(
              seconds: 5,
            ), () {
          overlayEntry.remove();
        });
      },
    );
  }
}
