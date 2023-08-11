import 'package:flutter/material.dart';
import 'package:music_app/base_widget/search.dart';
import 'package:music_app/screens/favorite/component/api_favorite.dart';
import 'package:music_app/screens/favorite/component/appbar_favorite.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarFavorite(),
      body: Column(
        children: [],
      ),
    );
  }
}
