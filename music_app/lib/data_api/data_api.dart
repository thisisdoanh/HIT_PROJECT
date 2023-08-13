import 'package:music_app/models/song.dart';
import 'package:music_app/models/user.dart';

class DataApi {
  static User? user;
  static Song? song;
  static String accessToken =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2NGMwMGU4NmRhYTc5OWU4ZDI2NTUxOTUiLCJpYXQiOjE2OTE4ODU0NzAsImV4cCI6MTY5MTg5MTQ3MCwidHlwZSI6ImFjY2VzcyJ9.OPGX6yYbXbCXqw-I7rzOdqQO0k_JTOYNC-HEd_ZeHpw";
  void reset() {
    user = null;
    song = null;
    accessToken = '';
  }
}
