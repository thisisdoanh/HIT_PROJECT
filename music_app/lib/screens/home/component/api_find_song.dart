import '../../../base_api_client/base_api_client.dart';
import '../../../const/url_api.dart';
import '../../../models/song.dart';

class ApiFindSong {
  Future<dynamic> findSong(String title) async {
    try {
      Map response = await BaseApiClient().get(
        UrlApi.baseUrl,
        UrlApi.findSong + title,
      );

      List<dynamic> data = response["songs"]["results"];
      List<Song> songs = [];
      // duyetList(songs, data);

      songs =
          data.map((e) => Song.fromJson(e as Map<String, dynamic>)).toList();
      songs = songs.take(10).toList();
      return songs;
    } catch (e) {
      return null;
    }
  }
}
