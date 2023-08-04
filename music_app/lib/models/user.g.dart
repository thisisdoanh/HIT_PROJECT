// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      username: json['username'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      avatar: json['avatar'] as String,
      gender: json['gender'] as String,
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
      isEmailVerified: json['isEmailVerified'] as bool,
      role: json['role'] as String,
      favoriteSongs: (json['favoriteSongs'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'avatar': instance.avatar,
      'gender': instance.gender,
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
      'isEmailVerified': instance.isEmailVerified,
      'role': instance.role,
      'favoriteSongs': instance.favoriteSongs,
      'image': instance.image,
    };
