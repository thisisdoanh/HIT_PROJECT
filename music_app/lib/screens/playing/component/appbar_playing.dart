import 'package:flutter/material.dart';
import 'package:music_app/base_widget/appbar.dart';
import '../../../models/song.dart';


class AppBarPlaying extends StatelessWidget implements PreferredSizeWidget {
  const AppBarPlaying({super.key, required this.song});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  final Song song;

  @override
  Widget build(BuildContext context) {
    return BaseAppbar(
      title: 'Play',
      leading: Icons.arrow_back_sharp,
      functionLeading: () {
        Navigator.pop(context);
      },
    );
  }
}
