import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:music_app/models/song.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String username;
  String email;
  String password;
  String name;
  String avatar;
  String gender;
  DateTime dateOfBirth;
  bool isEmailVerified;
  String role;
  List<Song> favoriteSongs;
  String image;

  User({
    required this.username,
    required this.email,
    required this.password,
    required this.name,
    required this.avatar,
    required this.gender,
    required this.dateOfBirth,
    required this.isEmailVerified,
    required this.role,
    required this.favoriteSongs,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
