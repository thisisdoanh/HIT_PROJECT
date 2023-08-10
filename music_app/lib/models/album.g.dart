// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Album _$AlbumFromJson(Map<String, dynamic> json) => Album(
      title: json['title'] as String,
      image: json['image'] as String,
      songs: (json['songs'] as List<dynamic>)
          .map((e) => Song.fromJson(e as Map<String, dynamic>))
          .toList(),
      releaseYear: json['releaseYear'] as String,
      singers: (json['singers'] as List<dynamic>)
          .map((e) => Singer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'tittle': instance.title,
      'image': instance.image,
      'songs': instance.songs,
      'releaseYear': instance.releaseYear,
      'singers': instance.singers,
    };
