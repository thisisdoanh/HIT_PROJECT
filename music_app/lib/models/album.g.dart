// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Album _$AlbumFromJson(Map<String, dynamic> json) => Album(
      tittle: json['tittle'] as String,
      image: json['image'] as String,
      songs: (json['songs'] as List<dynamic>)
          .map((e) => Song.fromJson(e as Map<String, dynamic>))
          .toList(),
      release_year: json['release_year'] as int,
      singer: (json['singer'] as List<dynamic>)
          .map((e) => Singer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'tittle': instance.tittle,
      'image': instance.image,
      'songs': instance.songs,
      'release_year': instance.release_year,
      'singer': instance.singer,
    };
