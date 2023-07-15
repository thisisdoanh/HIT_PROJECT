import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:music_app/models/singer.dart';
import 'package:music_app/models/song.dart';

part 'album.g.dart';

@JsonSerializable()
class Album {
  String tittle;
  String image;
  List<Song> songs;
  int release_year;
  List<Singer> singer;

  Album({
    required this.tittle,
    required this.image,
    required this.songs,
    required this.release_year,
    required this.singer,
  });

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}
