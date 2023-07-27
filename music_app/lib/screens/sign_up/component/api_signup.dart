import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/base_api_client/api_exceptions.dart';
import 'package:music_app/base_api_client/base_api_client.dart';
import 'package:music_app/const/url_api.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:music_app/models/exception.dart';

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
        // "dateOfBirth": dateOfBirth,
        // "gender": gender,
      });
      //  print(response["message"]);
    } on UnauthorizedException catch (e) {
      String message = e.message ?? "";
showAlertDialog(
  context: context,
  builder: (context, child) {
    return AlertDialog(
      title: Text('Chú ý'),
      content: Text('Bạn có chắc muốn xoá dữ liệu không?'),
      actions: <Widget>[
        ElevatedButton(
          child: Text('Huỷ'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: Text('Xoá'),
          onPressed: () {
            // Xoá dữ liệu và đóng hộp thoại cảnh báo
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  },
);
      print("/n/n");
      print(message);
      //  print(e);

      return null;
    } on BadRequestException catch (e) {
      String message = e.message ?? "";
      showAlertDialog(
        context: context,
        builder: (context, child) {
          return AlertDialog(
            title: Text(message),
          );
        },
      );
      print("/n/n");
      print(message);
      return null;
    }
  }
}
