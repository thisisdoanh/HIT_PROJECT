// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Song _$SongFromJson(Map<String, dynamic> json) => Song(
      title: json['title'] as String,
      singers: (json['singers'] as List<dynamic>)
          .map((e) => Singer.fromJson(e as Map<String, dynamic>))
          .toList(),
      duration: json['duration'] as int,
      genre: json['genre'] as String,
      filePath: json['filePath'] as String,
      lyrics: json['lyrics'] as String,
      countListen: json['countListen'] as int,
      likeNumber: json['likeNumber'] as int,
      dislikeNumber: json['dislikeNumber'] as int,
      image: json['image'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$SongToJson(Song instance) => <String, dynamic>{
      'title': instance.title,
      'singers': instance.singers,
      'duration': instance.duration,
      'genre': instance.genre,
      'filePath': instance.filePath,
      'lyrics': instance.lyrics,
      'countListen': instance.countListen,
      'likeNumber': instance.likeNumber,
      'dislikeNumber': instance.dislikeNumber,
      'image': instance.image,
      'id': instance.id,
    };
