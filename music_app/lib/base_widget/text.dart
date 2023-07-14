import 'package:flutter/cupertino.dart';

class BaseText extends StatelessWidget {
  const BaseText({
    super.key,
    required this.text,
    required this.padding,
    required this.textStyle,
  });

  final String text;
  final double padding;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Text(
        text,
        style: textStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
