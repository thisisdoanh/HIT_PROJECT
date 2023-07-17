import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_app/const/color.dart';
import 'package:music_app/const/dimen.dart';
import 'package:music_app/const/component.dart';

class BaseTextFormField extends StatelessWidget {
  const BaseTextFormField(
      {super.key,
      required this.text,
      required this.width,
      required this.validator,
      required this.controller, required this.textInputType, required this.isHide});
  final String text;
  final FormFieldValidator validator;
  final double width;
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool isHide;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(Dimen.padding0),
      child: TextFormField(
        obscureText: isHide,
        validator: validator,
        keyboardType: textInputType,
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
