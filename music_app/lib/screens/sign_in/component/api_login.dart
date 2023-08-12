// ignore_for_file: avoid_print

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:music_app/base_api_client/base_api_client.dart';
import 'package:music_app/const/url_api.dart';
import 'package:music_app/data_api/data_api.dart';
import 'package:music_app/models/user.dart';

import '../../../base_api_client/api_exceptions.dart';

class ApiLogin {
  Future<dynamic> getAccount(String username, String password,BuildContext context) async {
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
    } on UnauthorizedException catch (e) {
      String message = e.message ?? "";
      showAlertDialog(
        context: context,
        builder: (context, child) {
          return AlertDialog(
            title: const Text('Lỗi'),
            content: Text(message),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return false;
    } on BadRequestException catch (e) {
      String message = e.message ?? "";
      showAlertDialog(
        context: context,
        builder: (context, child) {
          return AlertDialog(
            title: const Text('Lỗi'),
            content: Text(message),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return false;
    } catch (e) {
      showAlertDialog(
        context: context,
        builder: (context, child) {
          return AlertDialog(
            title: const Text('Lỗi'),
            content: Text(e.toString()),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return false;
    }
  }
}
