import 'package:flutter/material.dart';

class ColorConst {
  static const Color colorButton = Color.fromARGB(255, 199, 8, 107);
  static const Color colorTextButton = Color.fromARGB(255, 255, 255, 255);
  static Color primaryColorTextFormField =
      const Color.fromARGB(255, 255, 255, 255).withOpacity(0.13);
  static const Color colorText = Color.fromARGB(255, 255, 255, 255);
  static const Gradient colorAppIcon = LinearGradient(
    colors: [
      Color.fromRGBO(255, 81, 202, 1),
      Color.fromRGBO(199, 8, 107, 1),
    ],
  );
}
