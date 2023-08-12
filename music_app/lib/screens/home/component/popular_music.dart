import 'package:flutter/material.dart';
import 'package:music_app/base_widget/button_nocolor.dart';
import 'package:music_app/base_widget/image.dart';
import 'package:music_app/call_api/api_album.dart';
import 'package:music_app/call_api/api_singer.dart';
import 'package:music_app/const/color.dart';
import 'package:music_app/const/component.dart';
import 'package:music_app/const/routes_screen.dart';
import 'package:music_app/models/album.dart';
import 'package:music_app/screens/playing/playing.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
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
    fetch();
    super.initState();
  }

  Future<void> fetch() async {
    songs = await ApiSong().getSongs();
    singers = await ApiSinger().getSingers();
    albums = await ApiAlbum().getAlbums();
    await Future.delayed(
      Duration.zero,
      () {
        setState(() {});
      },
    );
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
                // print("object");
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
        SizedBox(
          height: 178,
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        // return listSong(songs[index]);
                        return pressButton == 1
                            ? listSong(songs[index])
                            : (pressButton == 2
                                ? listSinger(singers[index])
                                : listAlbum(
                                    albums[index],
                                  ));
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                      itemCount: pressButton == 1
                          ? songs.length
                          : (pressButton == 2
                              ? singers.length
                              : albums.length))),
            ],
          ),
        ),
      ],
    );
  }

  InkWell listSong(Song song) {
    return InkWell(
        onTap: () {
          // context.read<Controller>().startAudioPlayer();
          // await Future.delayed(
          //   Duration(seconds: 2),
          // );
          // Navigator.pushNamed(context, RoutesScreen.routesPlaying,
          //     arguments: song);

          PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
            context,
            settings: RouteSettings(
                name: RoutesScreen.routesPlaying, arguments: song),
            screen: const PlayMusicScreen(),
            withNavBar: true,
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        },
        child: SizedBox(
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

  InkWell listSinger(Singer singer) {
    return InkWell(
        onTap: () {},
        child: SizedBox(
          height: 178,
          width: 135,
          child: Column(
            children: [
              BaseImageNetwork(
                  height: 135,
                  width: 135,
                  linkImage: singer.image,
                  borderRadius: 30),
              const SizedBox(
                height: 10,
              ),
              Text(
                singer.name,
                style: Component.textStyleText,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ));
  }

  InkWell listAlbum(Album album) {
    return InkWell(
        onTap: () {},
        child: SizedBox(
          height: 178,
          width: 135,
          child: Column(
            children: [
              BaseImageNetwork(
                  height: 135,
                  width: 135,
                  linkImage: album.image,
                  borderRadius: 30),
              const SizedBox(
                height: 10,
              ),
              Text(
                album.title,
                style: Component.textStyleText,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ));
  }
}
