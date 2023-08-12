import 'package:flutter/material.dart';
import 'package:music_app/base_widget/button.dart';
import 'package:music_app/base_widget/image.dart';
import 'package:music_app/const/component.dart';
import 'package:music_app/models/album.dart';
import 'package:music_app/screens/album/component/ex_album.dart';
import 'package:music_app/screens/album/component/favorite_button.dart';

import '../../const/color.dart';
import 'component/appbar_album.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  static Album album = Album.fromJson(ExAlbum.ex);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarAlbum(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(100, 20, 100, 18),
            child: BaseImageNetwork(
                height: 174,
                width: 174,
                linkImage: album.image,
                borderRadius: 60),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      album.title,
                      style: Component.albumTitle,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Album by ${album.singers.map((singer) => singer.name).join(', ')}',
                      style: Component.singerName,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      '${album.songs.length} Songs',
                      style: Component.singerName,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                const FavoriteButton(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: BaseButton(
              text: 'Shuffle',
              function: () {},
              height: 60,
              width: double.infinity,
              textStyle: Component.textStyleTittle,
              borderRadius: 20,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: album.songs.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        BaseImageNetwork(
                          height: 60,
                          width: 60,
                          linkImage: album.songs[index].image,
                          borderRadius: 10,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Text(
                              album.songs[index].title,
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
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
