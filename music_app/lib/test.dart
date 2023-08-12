import 'package:flutter/material.dart';
import 'package:music_app/screens/favorite/component/api_favorite.dart';

import 'models/song.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  static List<Song> songs = [];
  Future<void> fetch() async {
    songs = await ApiFavorite().getFavoriteSong(context);
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}