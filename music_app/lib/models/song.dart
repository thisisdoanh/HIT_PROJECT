// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:music_app/models/singer.dart';

part 'song.g.dart';

@JsonSerializable()
class Song {
  String title;
  List<String> singers;
  int duration;
  String genre;
  // ignore: non_constant_identifier_names
  String filePath;
  String lyrics;
  int countListen;
  int likeNumber;
  int dislikeNumber;
  String image;
  Song({
    required this.title,
    required this.singers,
    required this.duration,
    required this.genre,
    // ignore: non_constant_identifier_names
    required this.filePath,
    required this.lyrics,
    required this.countListen,
    required this.likeNumber,
    required this.dislikeNumber,
    required this.image,
  });

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);
  Map<String, dynamic> toJson() => _$SongToJson(this);
}
