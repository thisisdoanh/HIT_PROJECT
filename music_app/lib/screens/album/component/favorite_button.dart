import 'package:flutter/material.dart';
import 'package:music_app/const/color.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  static bool favorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          favorite = !favorite;
        });
      },
      icon: Icon(
        favorite ? Icons.favorite : Icons.favorite_border,
        color: ColorConst.colorButton,
      ),
    );
  }
}
