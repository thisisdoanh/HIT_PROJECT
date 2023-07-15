// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Playlist _$PlaylistFromJson(Map<String, dynamic> json) => Playlist(
      name: json['name'] as String,
      description: json['description'] as String,
      songs: (json['songs'] as List<dynamic>)
          .map((e) => Song.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdBy: User.fromJson(json['createdBy'] as Map<String, dynamic>),
      createAt: DateTime.parse(json['createAt'] as String),
    );

Map<String, dynamic> _$PlaylistToJson(Playlist instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'songs': instance.songs,
      'createdBy': instance.createdBy,
      'createAt': instance.createAt.toIso8601String(),
    };
