// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:music_app/models/singer.dart';
import 'package:music_app/models/song.dart';

part 'album.g.dart';

@JsonSerializable()
class Album {
  String title;
  String image;
  List<Song> songs;
  // ignore: non_constant_identifier_names
  String releaseYear;
  List<Singer> singers;

  Album({
    required this.title,
    required this.image,
    required this.songs,
    // ignore: non_constant_identifier_names
    required this.releaseYear,
    required this.singers,
  });

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}
