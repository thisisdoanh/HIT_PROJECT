// ignore_for_file: avoid_print

import 'package:music_app/base_api_client/base_api_client.dart';
import 'package:music_app/const/url_api.dart';
import 'package:music_app/data_api/data_api.dart';
import 'package:music_app/models/user.dart';

class ApiFavorite {
  Future<dynamic> getInfo(String username, String password) async {
    try {
      Map response = await BaseApiClient().post(
        UrlApi.baseUrl,
        UrlApi.login,
        {
          "usernameOrEmail": username,
          "password": password,
        },
      );
      User user = User.fromJson(response["user"]);
      DataApi.accessToken = response["tokens"]["access"]["token"];
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}