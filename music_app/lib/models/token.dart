// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:music_app/models/user.dart';

part 'token.g.dart';

@JsonSerializable()
class Token {
  String tokenName;
  User user;
  String type;
  DateTime expires;
  bool blacklisted;

  Token({
    required this.tokenName,
    required this.user,
    required this.type,
    required this.expires,
    required this.blacklisted,
  });

    factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
  Map<String, dynamic> toJson() => _$TokenToJson(this);
}
