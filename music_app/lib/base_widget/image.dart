import 'package:flutter/material.dart';

class BaseImage extends StatelessWidget {
  const BaseImage({
    super.key,
    required this.height,
    required this.width,
    required this.assetImage,
    required this.borderRadius,
  });

  final double height;
  final double width;
  final String assetImage;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(assetImage),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}

class BaseImageNetwork extends StatelessWidget {
  const BaseImageNetwork({
    super.key,
    required this.height,
    required this.width,
    required this.linkImage,
    required this.borderRadius,
  });

  final double height;
  final double width;
  final String linkImage;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(linkImage),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}
