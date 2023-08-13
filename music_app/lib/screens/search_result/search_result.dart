// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/base_widget/image.dart';
import 'package:music_app/const/routes_screen.dart';
import 'package:music_app/data_api/data_api.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/screens/favorite/component/api_favorite.dart';
import 'package:music_app/screens/playing/playing.dart';
import 'package:music_app/screens/profile/component/api_info.dart';
import 'package:music_app/screens/search_result/appbar_search.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../const/color.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({Key? key, required this.listSongs})
      : super(key: key);

  final List<Song> listSongs;

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  List<bool> isFavorited = [];

  @override
  void initState() {
    _init();

    for (var song in widget.listSongs) {
      bool check = false;
      for (var element in DataApi.user!.favoriteSongs) {
        if (element == song.id) {
          check = true;
          isFavorited.add(true);
          break;
        }
      }
      if (!check) {
        isFavorited.add(false);
      }
    }

    super.initState();
  }

  Future<void> _init() async {
    await ApiInfo().getInfo();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<String> listSingers = [];

    for (int i = 0; i < widget.listSongs.length; i++) {
      Song song = widget.listSongs[i];
      listSingers.add(song.singers.map((e) => e.name.toString()).join("+"));
    }

    return Scaffold(
      appBar: const AppBarSearch(),
      body: ListView.builder(
        itemCount: widget.listSongs.length,
        itemBuilder: (context, index) {
          final Song song = widget.listSongs[index];

          return Column(
            children: [
              CupertinoButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  Navigator.pop(context);
                  PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                    context,
                    screen: const PlayMusicScreen(),
                    settings: RouteSettings(
                        name: RoutesScreen.routesPlaying, arguments: song),
                  );
                },
                child: ListTile(
                  leading: BaseImageNetwork(
                    height: 50,
                    width: 50,
                    linkImage: song.image,
                    borderRadius: 8,
                  ),
                  title: Text(
                    song.title,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(listSingers[index]),
                  trailing: CupertinoButton(
                    onPressed: () async {
                      // print(isFavorited);
                      isFavorited[index] = !isFavorited[index];
                      isFavorited[index] == true
                          ? await ApiFavorite()
                              .addSongToFavorite(context, song.id)
                          : await ApiFavorite()
                              .deleteSongFromFavorite(context, song.id);

                      await Future.delayed(Duration.zero);
                      setState(() {});
                    },
                    child: Icon(
                      isFavorited[index] == true
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: ColorConst.colorButton,
                    ),
                  ),
                ),
              ),
              const Divider(
                thickness: 2,
              ),
            ],
          );
        },
      ),
    );
  }
}
