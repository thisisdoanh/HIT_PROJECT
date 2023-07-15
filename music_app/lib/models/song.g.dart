// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Song _$SongFromJson(Map<String, dynamic> json) => Song(
      tittle: json['tittle'] as String,
      singer: (json['singer'] as List<dynamic>)
          .map((e) => Singer.fromJson(e as Map<String, dynamic>))
          .toList(),
      duration: json['duration'] as int,
      genre: json['genre'] as String,
      file_path: json['file_path'] as String,
      lyris: json['lyris'] as String,
      countListen: json['countListen'] as int,
      likeNumber: json['likeNumber'] as int,
      dislikeNumber: json['dislikeNumber'] as int,
    );

Map<String, dynamic> _$SongToJson(Song instance) => <String, dynamic>{
      'tittle': instance.tittle,
      'singer': instance.singer,
      'duration': instance.duration,
      'genre': instance.genre,
      'file_path': instance.file_path,
      'lyris': instance.lyris,
      'countListen': instance.countListen,
      'likeNumber': instance.likeNumber,
      'dislikeNumber': instance.dislikeNumber,
    };
