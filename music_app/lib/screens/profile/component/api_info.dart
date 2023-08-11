// ignore_for_file: avoid_print

import 'package:music_app/base_api_client/base_api_client.dart';
import 'package:music_app/const/url_api.dart';
import 'package:music_app/data_api/data_api.dart';
import 'package:music_app/models/user.dart';

class ApiInfo {
  Future<dynamic> getInfo() async {
    try {
      Map response = await BaseApiClient().get(
        UrlApi.baseUrl,
        UrlApi.infoUser,
      );
      DataApi.user = User.fromJson(response["user"]);
      return true;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
