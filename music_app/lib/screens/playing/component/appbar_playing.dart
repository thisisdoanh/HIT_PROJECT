import 'package:flutter/material.dart';
import 'package:music_app/base_widget/appbar.dart';

class AppBarPlaying extends StatelessWidget implements PreferredSizeWidget {
  const AppBarPlaying({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return BaseAppbar(
      title: 'Play',
      leading: Icons.arrow_back_sharp,
      functionLeading: () => Navigator.of(context).pop(),
    );
  }
}
