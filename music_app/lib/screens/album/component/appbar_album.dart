import 'package:flutter/material.dart';
import 'package:music_app/base_widget/appbar.dart';

import '../../../const/icon.dart';
import '../../../const/routes_screen.dart';

class AppBarAlbum extends StatelessWidget implements PreferredSizeWidget {
  const AppBarAlbum({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return BaseAppbar(
      title: 'Albums',
      leading: Icons.arrow_back_sharp,
      functionLeading: () => Navigator.of(context).pop(),
      actions: IconConst.iconProfile,
      functionActions: () => Navigator.pushNamed(
        context,
        RoutesScreen.routesProfile,
      ),
    );
  }
}
