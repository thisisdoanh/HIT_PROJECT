import 'package:flutter/material.dart';
import 'package:music_app/const/component.dart';

// final ThemeData appbarThemeData = ThemeData(
//   appBarTheme: const AppBarTheme(
//     color: Colors.white,
//     iconTheme: IconThemeData(color: Colors.black),
//   ),
//   textTheme: const TextTheme(
//     headlineSmall: TextStyle(
//       fontFamily: 'Poppins',
//       fontSize: 15,
//       fontWeight: FontWeight.w500,
//       color: Colors.black,
//     ),
//   ),
// );

class BaseAppbar extends StatefulWidget {
  const BaseAppbar({
    super.key,
    this.leading,
    this.functionLeading,
    required this.title,
    this.actions,
    this.functionActions,
  });

  final IconData? leading;
  final Function? functionLeading;
  final String title;
  final IconData? actions;
  final Function? functionActions;

  @override
  State<BaseAppbar> createState() => _BaseAppbarState();
}

class _BaseAppbarState extends State<BaseAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          widget.leading,
          color: Colors.white,
        ),
        onPressed: () {
          widget.functionLeading!();
        },
      ),
      centerTitle: true,
      title: Text(
        widget.title,
        style: Component.textStyleTittle,
      ),
      actions: [
        IconButton(
          onPressed: () {
            widget.functionActions!();
          },
          icon: Icon(
            widget.actions,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class Compomemt {}
