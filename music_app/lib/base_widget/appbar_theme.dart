import 'package:flutter/material.dart';

final ThemeData appbarThemeData = ThemeData(
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
  ),
  textTheme: const TextTheme(
    headlineSmall: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
  ),
);
