import 'package:flutter/material.dart';
import 'package:music_app/const/dimen.dart';

class BaseImage extends StatelessWidget {
  const BaseImage({
    super.key,
    required this.height,
    required this.width,
    required this.assetImage,
  });

  final double height;
  final double width;
  final String assetImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(assetImage),
          fit: BoxFit.contain,
        ),
        borderRadius: BorderRadius.circular(Dimen.borderRadiusImage),
      ),
    );
  }
}
