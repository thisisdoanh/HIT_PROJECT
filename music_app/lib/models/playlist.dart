import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/models/user.dart';

part 'playlist.g.dart';

@JsonSerializable()
class Playlist {
  String name;
  String description;
  List<Song> songs;
  User createdBy;
  DateTime createAt;
  String image;

  Playlist({
    required this.name,
    required this.description,
    required this.songs,
    required this.createdBy,
    required this.createAt,
    required this.image,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) =>
      _$PlaylistFromJson(json);
  Map<String, dynamic> toJson() => _$PlaylistToJson(this);
}
