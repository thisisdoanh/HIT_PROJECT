import 'package:flutter/material.dart';
import 'package:music_app/base_api_client/api_exceptions.dart';
import 'package:music_app/base_api_client/base_api_client.dart';
import 'package:music_app/const/url_api.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';

class ApiSignUp {
  Future<dynamic> regisAccount(
      String firstName,
      String lastName,
      String email,
      String pass,
      String username,
      DateTime dateOfBirth,
      String gender,
      BuildContext context) async {
    try {
      await BaseApiClient().post(UrlApi.baseUrl, UrlApi.signup, {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": pass,
        "username": username,
        "dateOfBirth": dateOfBirth,
        "gender": gender,
      });
      //  print(response["message"]);
    } on UnauthorizedException catch (e) {
      String message = e.message ?? "";
      // ignore: unused_result
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
      return null;
    } on BadRequestException catch (e) {
      String message = e.message ?? "";
      // ignore: unused_result
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
      return null;
    } catch (e) {
      // ignore: unused_result
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

      return null;
    }
  }
}
