import 'package:flutter/material.dart';
import 'package:music_app/base_widget/appbar.dart';


class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return const BaseAppbar(
      title: 'Home',
      // actions: IconConst.iconProfile,
      // functionActions: () => Navigator.pushNamed(
      //   context,
      //   RoutesScreen.routesProfile,
      // ),
    );
  }
}
