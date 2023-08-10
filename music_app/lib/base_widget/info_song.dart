import 'package:flutter/material.dart';
import 'package:music_app/base_widget/image.dart';
import 'package:music_app/const/component.dart';

class SongInfo extends StatelessWidget {
  const SongInfo({
    super.key,
    required this.imageUrl,
    required this.tittle,
    required this.artist,
    required this.lyrics,
  });
  final String imageUrl;
  final String tittle;
  final String artist;
  final String lyrics;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // DecoratedBox(
        //   decoration: BoxDecoration(
        //     boxShadow: const [
        //       BoxShadow(
        //         color: Colors.black12,
        //         offset: Offset(2, 4),
        //         blurRadius: 4,
        //       ),
        //     ],
        //     borderRadius: BorderRadius.circular(10),
        //   ),
        //   child: ClipRRect(
        //     borderRadius: BorderRadius.circular(10),
        //     child: Image.network(
        //       imageUrl,
        //       height: 300,
        //       width: 300,
        //     ),
        //   ),
        // ),
        DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 255, 255, 255),
                blurRadius: 95,
                spreadRadius: 10,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: BaseImageNetwork(
            height: 250,
            width: 250,
            linkImage: imageUrl,
            borderRadius: 95,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          tittle,
          style: Component.textStyleMusicName,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          artist,
          style: Component.textStyleText,
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
      ],
    );
  }
}
