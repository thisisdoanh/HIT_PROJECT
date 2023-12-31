// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String username;
  String email;
  String firstName;
  String lastName;
  String avatar;
  String gender;
  DateTime dateOfBirth;
  bool isEmailVerified;
  String role;
  List<String> favoriteSongs;
  String? image;

  User({
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
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
