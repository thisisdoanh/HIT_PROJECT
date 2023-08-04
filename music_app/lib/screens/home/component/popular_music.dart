import 'package:flutter/material.dart';
import 'package:music_app/base_widget/button_nocolor.dart';
import 'package:music_app/base_widget/image.dart';
import 'package:music_app/call_api/api_album.dart';
import 'package:music_app/const/color.dart';
import 'package:music_app/const/component.dart';
import 'package:music_app/models/album.dart';

import '../../../call_api/api_singer.dart';
import '../../../models/singer.dart';
import '../../../models/song.dart';
import 'package:music_app/call_api/api_song.dart';

class PopularMusic extends StatefulWidget {
  const PopularMusic({super.key});

  @override
  State<PopularMusic> createState() => _PopularMusicState();
}

class _PopularMusicState extends State<PopularMusic> {
  // static const List<String> data = ['Song', 'Singer', 'Album'];
  static List<Color> colorButton = [
    ColorConst.colorButton,
    ColorConst.colorButton1,
    ColorConst.colorButton1,
  ];
  static List<Song> songs = [];
  static List<Singer> singers = [];
  static List<Album> albums = [];
  static int pressButton = 1;

  @override
  void initState() {
    super.initState();
    fetch();
  }

  static Future<void> fetch() async {
    songs = await ApiSong().getSongs();
    print(songs.length);
    // singers = await ApiSinger().getSingers();
    // albums = await ApiAlbum().getAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            BaseButton1(
              text: 'Song',
              function: () {
                pressButton = 1;
                colorButton = [
                  ColorConst.colorButton,
                  ColorConst.colorButton1,
                  ColorConst.colorButton1,
                ];

                setState(() {});
              },
              height: 50,
              width: 83,
              textStyle: Component.textStyleText,
              borderRadius: 20,
              color: colorButton[0],
            ),
            const SizedBox(
              width: 10,
            ),
            BaseButton1(
              text: 'Singer',
              function: () {
                pressButton = 2;
                colorButton = [
                  ColorConst.colorButton1,
                  ColorConst.colorButton,
                  ColorConst.colorButton1,
                ];
                setState(() {});
              },
              height: 50,
              width: 83,
              textStyle: Component.textStyleText,
              borderRadius: 20,
              color: colorButton[1],
            ),
            const SizedBox(
              width: 10,
            ),
            BaseButton1(
              text: 'Album',
              function: () {
                pressButton = 3;
                colorButton = [
                  ColorConst.colorButton1,
                  ColorConst.colorButton1,
                  ColorConst.colorButton,
                ];
                setState(() {});
              },
              height: 50,
              width: 83,
              textStyle: Component.textStyleText,
              borderRadius: 20,
              color: colorButton[2],
            ),
          ],
        ),
        const SizedBox(
          height: 32,
        ),
        Container(
          height: 178,
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return listSong(songs[index]);
                      // return pressButton == 1
                      //     ? listSong(songs[index])
                      //     : listSinger(singers[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                    itemCount: 10),
              ),
            ],
          ),
        ),
      ],
    );
  }

  InkWell listSong(Song song) {
    return InkWell(
        onTap: () {},
        child: Container(
          height: 178,
          width: 135,
          child: Column(
            children: [
              BaseImageNetwork(
                  height: 135,
                  width: 135,
                  linkImage: song.image,
                  borderRadius: 30),
              const SizedBox(
                height: 10,
              ),
              Text(
                song.title,
                style: Component.textStyleText,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ));
  }

  // InkWell listSinger(Singer singer) {
  //   return InkWell(
  //       onTap: () {},
  //       child: Container(
  //         height: 178,
  //         width: 135,
  //         child: Column(
  //           children: [
  //             BaseImageNetwork(
  //                 height: 135,
  //                 width: 135,
  //                 linkImage: singer.image,
  //                 borderRadius: 30),
  //             const SizedBox(
  //               height: 10,
  //             ),
  //             Text(
  //               singer.name,
  //               style: Component.textStyleText,
  //               overflow: TextOverflow.ellipsis,
  //             )
  //           ],
  //         ),
  //       ));
  // }

  // InkWell listAlbum(Album album) {
  //   return InkWell(
  //       onTap: () {},
  //       child: Container(
  //         height: 178,
  //         width: 135,
  //         child: Column(
  //           children: [
  //             BaseImageNetwork(
  //                 height: 135,
  //                 width: 135,
  //                 linkImage: album.image,
  //                 borderRadius: 30),
  //             const SizedBox(
  //               height: 10,
  //             ),
  //             Text(
  //               album.title,
  //               style: Component.textStyleText,
  //               overflow: TextOverflow.ellipsis,
  //             )
  //           ],
  //         ),
  //       ));
  // }
}
