// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
      tokenName: json['tokenName'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      type: json['type'] as String,
      expires: DateTime.parse(json['expires'] as String),
      blacklisted: json['blacklisted'] as bool,
    );

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'tokenName': instance.tokenName,
      'user': instance.user,
      'type': instance.type,
      'expires': instance.expires.toIso8601String(),
      'blacklisted': instance.blacklisted,
    };
