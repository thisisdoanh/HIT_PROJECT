import 'package:music_app/base_api_client/api_exceptions.dart';
import 'package:music_app/base_api_client/base_api_client.dart';
import 'package:music_app/const/url_api.dart';

import '../models/singer.dart';

class ApiSinger {
  Future<List<Singer>> getSingers() async {
    try {
      Map response = await BaseApiClient().get(UrlApi.baseUrl, UrlApi.singer);
      List<dynamic> data = response["singers"]["results"];
      List<Singer> singers = data.map((a) => Singer.fromJson(a)).toList();
      singers = singers.take(10).toList();

      return singers;
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
