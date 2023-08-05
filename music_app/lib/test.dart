import 'package:flutter/material.dart';
import 'package:music_app/const/string.dart';

import 'base_api_client/api_exceptions.dart';
import 'base_api_client/base_api_client.dart';
import 'const/url_api.dart';
import 'models/song.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  void duyetList(List<Song> songs, List<dynamic> data) {
    data.forEach((element) {
      songs.add(Song.fromJson(element));
    });
  }

  Future<void> get() async {
    try {
      Map response = await BaseApiClient().get(UrlApi.baseUrl, UrlApi.song);
      // print(response);
      List<dynamic> data = response["songs"]["results"];
      List<Song> songs = [];
      // duyetList(songs, data);

      songs =
          data.map((e) => Song.fromJson(e as Map<String, dynamic>)).toList();
      print(songs[0]);

      // print(data[0]);
      // List<Song> songs = data.map((a) => Song.fromJson(a)).toList();

      // print(song.image);
      songs = songs.take(10).toList();
      // print(songs[1].title);

      // return songs;
    } catch (e) {
      if (e is ApiExceptions) {
        print(e.prefix);
      } else {
        print('Caught an unknown exception: $e');
      }

      // return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    get();
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            StringConst.assetImgOnboarding1,
          ),
        ),
      ),
    );
  }
}
