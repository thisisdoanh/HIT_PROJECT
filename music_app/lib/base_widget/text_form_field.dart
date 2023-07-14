import 'package:flutter/material.dart';
import 'package:music_app/const/color.dart';
import 'package:music_app/const/dimen.dart';
import 'package:music_app/const/component.dart';

class BaseTextFormField extends StatelessWidget {
  const BaseTextFormField(
      {super.key,
      required this.text,
      required this.height,
      required this.width});
  final String text;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(Dimen.padding0),
      child: TextFormField(
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
