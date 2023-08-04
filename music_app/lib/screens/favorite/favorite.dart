import 'package:flutter/material.dart';
import 'package:music_app/screens/favorite/component/appbar_favorite.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      appBar: const AppbarFavorite(),
      body: Container(),
    );
  }
}
