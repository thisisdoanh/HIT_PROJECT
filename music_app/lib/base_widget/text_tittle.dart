import 'package:flutter/material.dart';

class BaseTextTittle extends StatelessWidget {
  const BaseTextTittle({
    super.key,
    required this.text,
    required this.width,
    required this.textStyle,
  });

  final String text;
  final double width;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
