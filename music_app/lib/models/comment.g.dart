// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      song: Song.fromJson(json['song'] as Map<String, dynamic>),
      user: (json['user'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      content:
          (json['content'] as List<dynamic>).map((e) => e as String).toList(),
      createAt:
          (json['createAt'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'song': instance.song,
      'user': instance.user,
      'content': instance.content,
      'createAt': instance.createAt,
    };
