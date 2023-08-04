import 'package:music_app/base_api_client/base_api_client.dart';
import 'package:music_app/const/url_api.dart';
import 'package:music_app/data_api/data_api.dart';
import 'package:music_app/models/user.dart';

class ApiLogin {
  Future<dynamic> getAccount(String username, String password) async {
    try {
      Map response = await BaseApiClient().post(
        UrlApi.baseUrl,
        UrlApi.login,
        {
          "username": username,
          "password": password,
        },
      );
      User user = User.fromJson(response["user"]);
      DataApi.accessToken = response["tokens"]["access"]["token"];
      print(DataApi.accessToken);
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
