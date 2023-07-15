import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'singer.g.dart';

@JsonSerializable()
class Singer {
  String name;
  String detail;
  String country;

  Singer({
    required this.name,
    required this.detail,
    required this.country,
  });

  factory Singer.fromJson(Map<String, dynamic> json) => _$SingerFromJson(json);

  Map<String, dynamic> toJson() => _$SingerToJson(this);
}
