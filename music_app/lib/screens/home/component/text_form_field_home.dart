import 'package:flutter/material.dart';
import 'package:music_app/base_widget/text_form_field.dart';
import 'package:music_app/const/string.dart';

class TextFormFieldHome extends StatelessWidget {
  TextFormFieldHome({super.key});
  final TextEditingController controllerSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseTextFormField(
      text: StringConst.textSearch,
      width: MediaQuery.of(context).size.width * 0.95,
      controller: controllerSearch,
      isHide: false,
      textInputType: TextInputType.text,
      validator: (value) {
        return null;
      },
    );
  }
}
