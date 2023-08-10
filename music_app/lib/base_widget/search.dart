import 'package:flutter/material.dart';
import 'package:music_app/base_widget/text_form_field_surfix_icon.dart';
import 'package:music_app/const/string.dart';

class BaseSearchBar extends StatelessWidget {
  const BaseSearchBar(
      {super.key, required this.controller, required this.function});
  final TextEditingController controller;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return BaseTextformFieldSurfixIcon(
      controller: controller,
      text: StringConst.textSearch,
      function: function,
      validator: (value) {},
      isReadOnly: false,
      surfixIcon: Icon(Icons.search_rounded),
    );
  }
}
