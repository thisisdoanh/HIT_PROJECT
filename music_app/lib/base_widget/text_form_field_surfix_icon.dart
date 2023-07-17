import 'package:flutter/material.dart';
import 'package:music_app/const/color.dart';
import 'package:music_app/const/component.dart';
import 'package:music_app/const/dimen.dart';

class BaseTextformFieldSurfixIcon extends StatelessWidget {
  const BaseTextformFieldSurfixIcon({
    super.key,
    required this.controller,
    required this.text,
    required this.function,
    required this.validator,
    required this.isReadOnly, required this.surfixIcon,
  });

  final TextEditingController controller;
  final String text;
  final Function function;
  final FormFieldValidator validator;
  final bool isReadOnly;
  final Icon surfixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
        fillColor: ColorConst.primaryColorTextFormField,
        hintStyle: Component.textStyleTextFormField,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimen.borderRadiusTextFormField),
        ),
        suffixIcon: surfixIcon,
      ),
      onTap: () {
        function();
      },
      readOnly: isReadOnly,
      validator: validator,
    );
  }
}
