import 'package:flutter/material.dart';
import 'package:music_app/base_widget/appbar.dart';

class AppBarSearch extends StatelessWidget implements PreferredSizeWidget {
  const AppBarSearch({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return BaseAppbar(
      title: 'Kết quả tìm kiếm',
      leading: Icons.arrow_back_sharp,
      functionLeading: () => Navigator.pop(context),
    );
  }
}
