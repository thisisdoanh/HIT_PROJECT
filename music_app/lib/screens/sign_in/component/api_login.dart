import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:music_app/base_api_client/base_api_client.dart';
import 'package:music_app/const/url_api.dart';
import 'package:music_app/models/user.dart';
import 'package:music_app/screens/sign_in/sign_in.dart';

class ApiLogin {
  Future<dynamic> getAccount(String username, String password) async {
    try {
      Map response = await BaseApiClient().post(
        UrlApi.baseUrl,
        UrlApi.login,
        {
          "password": password,
          "username": username,
        },
      );
      User user = User.fromJson(response["user"]);
      return user;
    } catch (e) {
      return null;
    }
  }
}
