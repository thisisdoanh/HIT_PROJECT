import 'package:flutter/material.dart';

import 'package:music_app/const/color.dart';
import 'package:music_app/const/dimen.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    required this.function,
    required this.height,
    required this.width,
    required this.textStyle,
  });
  final String text;
  final Function function;
  final double height;
  final double width;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
        backgroundColor: ColorConst.colorButton,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimen.borderRadiusButton),
        ),
      ),
      onPressed: () {
        function(context);
      },
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
