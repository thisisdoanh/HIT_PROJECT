// ignore_for_file: avoid_print

import 'package:music_app/base_api_client/api_exceptions.dart';
import 'package:music_app/base_api_client/base_api_client.dart';
import 'package:music_app/const/url_api.dart';

import '../models/song.dart';

class ApiSong {
  Future<List<Song>> getSongs() async {
    try {
      Map response = await BaseApiClient().get(UrlApi.baseUrl, UrlApi.song);

      // List<Song> dataSongs = Song.fromJson(response["songs"]["results"]).to

      List<dynamic> data = response["songs"]["results"];
      List<Song> songs = [];
      // duyetList(songs, data);

      songs =
          data.map((e) => Song.fromJson(e as Map<String, dynamic>)).toList();
      songs = songs.take(10).toList();

      return songs;
    } catch (e) {
      if (e is ApiExceptions) {
        print(e.prefix);
      } else {
        print('Caught an unknown exception: $e');
      }

      return [];
    }
  }
}
