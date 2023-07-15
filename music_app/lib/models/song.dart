import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:music_app/models/singer.dart';

part 'song.g.dart';

@JsonSerializable()
class Song {
  String tittle;
  List<Singer> singer;
  int duration;
  String genre;
  String file_path;
  String lyris;
  int countListen;
  int likeNumber;
  int dislikeNumber;
  Song({
    required this.tittle,
    required this.singer,
    required this.duration,
    required this.genre,
    required this.file_path,
    required this.lyris,
    required this.countListen,
    required this.likeNumber,
    required this.dislikeNumber,
  });

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);
  Map<String, dynamic> toJson() => _$SongToJson(this);
}
