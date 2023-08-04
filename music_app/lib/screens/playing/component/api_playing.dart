import 'package:flutter/material.dart';
import 'package:music_app/base_api_client/api_exceptions.dart';
import 'package:music_app/base_api_client/base_api_client.dart';
import 'package:music_app/const/url_api.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:music_app/models/song.dart';

class ApiPlaying {
  Future<Song> getSong() async {
    Map response = await BaseApiClient().get(
      UrlApi.baseUrl,
      "/songs/64bfdeeb0f8ff8941b5e440a",
    );
    Song song = Song.fromJson(response["song"]);
    return song;
  }
}
