import 'package:flutter/material.dart';
import 'package:music_app/base_widget/appbar.dart';
import 'package:music_app/const/icon.dart';
import '../../../const/routes_screen.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return BaseAppbar(
      title: 'Home',
      // actions: IconConst.iconProfile,
      // functionActions: () => Navigator.pushNamed(
      //   context,
      //   RoutesScreen.routesProfile,
      // ),
    );
  }
}
