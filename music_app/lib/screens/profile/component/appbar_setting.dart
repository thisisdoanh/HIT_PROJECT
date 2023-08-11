import 'package:flutter/material.dart';
import 'package:music_app/base_widget/appbar.dart';

class AppBarProfile extends StatelessWidget implements PreferredSizeWidget {
  const AppBarProfile({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return BaseAppbar(
      title: 'Profile',
      // leading: Icons.arrow_back_sharp,
      functionLeading: () => Navigator.of(context).pop(),
    );
  }
}
