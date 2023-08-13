import 'package:flutter/material.dart';
import 'package:music_app/base_widget/appbar.dart';

class AppbarFavorite extends StatelessWidget implements PreferredSizeWidget {
  const AppbarFavorite({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return const BaseAppbar(
      title: 'Favorite',
      // leading: Icons.arrow_back_sharp,
      // functionLeading: () => Navigator.of(context).pop(),
    );
  }
}
