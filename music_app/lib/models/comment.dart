import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/models/user.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  Song song;
  List<User> user;
  List<String> content;
  List<String> createAt;

  Comment({
    required this.song,
    required this.user,
    required this.content,
    required this.createAt,
  });

    factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
