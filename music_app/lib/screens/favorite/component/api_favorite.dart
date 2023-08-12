// ignore_for_file: unused_result, use_build_context_synchronously

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:music_app/base_api_client/api_exceptions.dart';
import 'package:music_app/base_api_client/base_api_client.dart';
import 'package:music_app/const/url_api.dart';
import 'package:music_app/models/song.dart';

class ApiFavorite {
  Future<dynamic> getFavoriteSong(BuildContext context) async {
    try {
      Map response =
          await BaseApiClient().get(UrlApi.baseUrl, UrlApi.favoriteSongs);
      List<dynamic> dataFavoriteSongs = response["favoriteSongs"];
      List<Song> favoriteSongs =
          dataFavoriteSongs.map((e) => Song.fromJson(e)).toList();
      return favoriteSongs;
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

  Future<dynamic> addSongToFavorite(BuildContext context, String id) async {
    try {
      Map response = await BaseApiClient()
          .post(UrlApi.baseUrl, "${UrlApi.favoriteSongs}/$id", {});
      if (response["message"] == "Song added to favorites successfully!") {
        showAlertDialog(
          context: context,
          builder: (context, child) {
            return AlertDialog(
              title: const Text('Done'),
              content: Text(response["message"]),
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
        return true;
      }
      return false;
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

  Future<dynamic> deleteSongFromFavorite(
      BuildContext context, String id) async {
    try {
      Map response = await BaseApiClient()
          .delete(UrlApi.baseUrl, "${UrlApi.favoriteSongs}/$id", {});
      if (response["message"] == "Song removed from favorites successfully!") {
        showAlertDialog(
          context: context,
          builder: (context, child) {
            return AlertDialog(
              title: const Text('Done'),
              content: Text(response["message"]),
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
        return true;
      }
      return false;
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
}
