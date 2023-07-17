import 'package:flutter/material.dart';
import 'package:music_app/const/color.dart';
import 'package:music_app/const/dimen.dart';
import 'package:music_app/const/component.dart';

class BaseTextFormField extends StatelessWidget {
  const BaseTextFormField(
      {super.key,
      required this.text,
      required this.width,
      this.validator,
      required this.controller});
  final String text;
  final FormFieldValidator? validator;
  final double width;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(Dimen.padding0),
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          hintText: text,
          fillColor: ColorConst.primaryColorTextFormField,
          hintStyle: Component.textStyleTextFormField,
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(Dimen.borderRadiusTextFormField),
          ),
        ),
      ),
    );
  }
}
