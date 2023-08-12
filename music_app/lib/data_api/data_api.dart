import 'package:music_app/models/song.dart';
import 'package:music_app/models/user.dart';

class DataApi {
  static User? user;
  static Song? song;
  static String accessToken =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2NGMwMGU4NmRhYTc5OWU4ZDI2NTUxOTUiLCJpYXQiOjE2OTE4NjM2MDcsImV4cCI6MTY5MTg2OTYwNywidHlwZSI6ImFjY2VzcyJ9.DJ7c7vLxJZqrSZSewUyVkOAkVmJ2tHkD-Pp8LkXZ4C4";
  void reset() {
    user = null;
    song = null;
    accessToken = '';
  }
}
