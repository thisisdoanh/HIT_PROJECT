// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:music_app/models/singer.dart';

part 'song.g.dart';

@JsonSerializable()
class Song {
  String tittle;
  List<Singer> singer;
  int duration;
  String genre;
  // ignore: non_constant_identifier_names
  String file_path;
  String lyris;
  int countListen;
  int likeNumber;
  int dislikeNumber;
  String image;
  Song({
    required this.tittle,
    required this.singer,
    required this.duration,
    required this.genre,
    // ignore: non_constant_identifier_names
    required this.file_path,
    required this.lyris,
    required this.countListen,
    required this.likeNumber,
    required this.dislikeNumber,
    required this.image,
  });

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);
  Map<String, dynamic> toJson() => _$SongToJson(this);
}
