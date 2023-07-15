// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'singer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Singer _$SingerFromJson(Map<String, dynamic> json) => Singer(
      name: json['name'] as String,
      detail: json['detail'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$SingerToJson(Singer instance) => <String, dynamic>{
      'name': instance.name,
      'detail': instance.detail,
      'country': instance.country,
    };
