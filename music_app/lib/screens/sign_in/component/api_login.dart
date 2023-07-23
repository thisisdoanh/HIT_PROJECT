import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:music_app/base_api_client/base_api_client.dart';
import 'package:music_app/const/url_api.dart';
import 'package:music_app/models/user.dart';
import 'package:music_app/screens/sign_in/sign_in.dart';

class ApiLogin {
  Future<void> getAccount(String username, String password) async {
    var response = await BaseApiClient().post(
      UrlApi.base_url,
      UrlApi.login,
      {"username": username, "password": password},
    );
    print(response);
    print(response["user"]["username"]);
  }
}
