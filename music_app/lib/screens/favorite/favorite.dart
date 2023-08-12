import 'package:flutter/material.dart';
import 'package:music_app/screens/favorite/component/body.dart';

import 'component/appbar_favorite.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppbarFavorite(),
      body: Column(
        children: [
          BodyFavorite(),
        ],
      ),
    );
  }
}
