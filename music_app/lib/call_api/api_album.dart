// ignore_for_file: avoid_print

import 'package:music_app/base_api_client/api_exceptions.dart';
import 'package:music_app/base_api_client/base_api_client.dart';
import 'package:music_app/const/url_api.dart';
import 'package:music_app/models/album.dart';

class ApiAlbum {
  Future<List<Album>> getAlbums() async {
    try {
      Map response = await BaseApiClient().get(UrlApi.baseUrl, UrlApi.album);
      List<dynamic> data = response["albums"]["results"];
      List<Album> albums = data.map((a) => Album.fromJson(a)).toList();
      albums = albums.toList();

      return albums;
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
