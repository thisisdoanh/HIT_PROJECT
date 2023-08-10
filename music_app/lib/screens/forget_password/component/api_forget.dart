// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:music_app/base_api_client/api_exceptions.dart';
import 'package:music_app/base_api_client/base_api_client.dart';
import 'package:music_app/const/url_api.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';

class ApiForgetPassword {
  Future<dynamic> forgetAccount(String email, BuildContext context) async {
    try {
      Map response =
          await BaseApiClient().post(UrlApi.baseUrl, UrlApi.forgetAccount, {
        "email": email,
      });
      String message = response["message"];
      return message;
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
      return null;
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
      return null;
    } on NotFoundException catch (e) {
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
      return null;
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
      return null;
    }
  }

  Future<dynamic> verifyOtp(
      String email, String otp, BuildContext context) async {
    try {
      await BaseApiClient()
          .post(UrlApi.baseUrl, UrlApi.verifyOtpForgetPassword, {
        "email": email,
        "otp": otp,
      });

      return true;
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
      return null;
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
      return null;
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
      return null;
    }
  }

  Future<dynamic> resetPassOtp(String email, String newPassword,
      String confirmPassword, BuildContext context) async {
    try {
      Map response =
          await BaseApiClient().post(UrlApi.baseUrl, UrlApi.resetPassword, {
        "email": email,
        "newPassword": newPassword,
        "confirmPassword": confirmPassword,
      });
      String message = response["message"];
      return message;
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
      return null;
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
      return null;
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
      return null;
    }
  }
}
