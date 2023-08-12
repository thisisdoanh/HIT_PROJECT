import 'package:flutter/material.dart';
import 'package:music_app/screens/favorite/component/api_favorite.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../base_widget/button_nocolor.dart';
import '../../../base_widget/image.dart';
import '../../../const/color.dart';
import '../../../const/component.dart';
import '../../../const/routes_screen.dart';
import '../../../models/song.dart';
import '../../playing/playing.dart';

class BodyFavorite extends StatefulWidget {
  const BodyFavorite({super.key});

  @override
  State<BodyFavorite> createState() => _BodyFavoriteState();
}

class _BodyFavoriteState extends State<BodyFavorite> {
  static List<Color> colorButton = [
    ColorConst.colorButton,
    ColorConst.colorButton1,
    ColorConst.colorButton1,
  ];
  static List<Song> songs = [];
  // static List<Singer> singers = [];
  // static List<Album> albums = [];
  // static int pressButton = 1;

  @override
  void initState() {
    fetch();
    super.initState();
  }

  Future<void> fetch() async {
    songs = await ApiFavorite().getFavoriteSong(context);
    // singers = await ApiSinger().getSingers();
    // albums = await ApiAlbum().getAlbums();
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
                // pressButton = 1;
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
            // BaseButton1(
            //   text: 'Singer',
            //   function: () {
            //     pressButton = 2;
            //     colorButton = [
            //       ColorConst.colorButton1,
            //       ColorConst.colorButton,
            //       ColorConst.colorButton1,
            //     ];
            //     setState(() {});
            //   },
            //   height: 50,
            //   width: 83,
            //   textStyle: Component.textStyleText,
            //   borderRadius: 20,
            //   color: colorButton[1],
            // ),
            // const SizedBox(
            //   width: 10,
            // ),
            // BaseButton1(
            //   text: 'Album',
            //   function: () {
            //     pressButton = 3;
            //     colorButton = [
            //       ColorConst.colorButton1,
            //       ColorConst.colorButton1,
            //       ColorConst.colorButton,
            //     ];
            //     setState(() {});
            //   },
            //   height: 50,
            //   width: 83,
            //   textStyle: Component.textStyleText,
            //   borderRadius: 20,
            //   color: colorButton[2],
            // ),
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
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    // print(songs[index]);
                    return listSong(songs[index]);
                    // return pressButton == 1
                    //     ? listSong(songs[index])
                    //     : (pressButton == 2
                    //         ? listSinger(singers[index])
                    //         : listAlbum(
                    //             albums[index],
                    //           ));
                  },
                  itemCount: songs.length,
                  //  pressButton == 1
                  //     ? songs.length
                  //     : (pressButton == 2
                  //         ? singers.length
                  // : albums.length),
                ),
              ),
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
          settings:
              RouteSettings(name: RoutesScreen.routesPlaying, arguments: song),
          screen: const PlayMusicScreen(),
          withNavBar: true,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Row(
        children: [
          BaseImageNetwork(
            height: 60,
            width: 60,
            linkImage: song.image,
            borderRadius: 10,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Text(
                song.title,
                style: const TextStyle(
                  color: ColorConst.colorText,
                  fontFamily: 'inter',
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              // Text(
              //   album.songs[index].singers[0].name,
              // ),
            ],
          ),
        ],
      ),
    );
  }

  // InkWell listSinger(Singer singer) {
  //   return InkWell(
  //       onTap: () {},
  //       child: SizedBox(
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
  //     onTap: () {},
  //     child: SizedBox(
  //       height: 178,
  //       width: 135,
  //       child: Column(
  //         children: [
  //           BaseImageNetwork(
  //               height: 135,
  //               width: 135,
  //               linkImage: album.image,
  //               borderRadius: 30),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           Text(
  //             album.title,
  //             style: Component.textStyleText,
  //             overflow: TextOverflow.ellipsis,
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
