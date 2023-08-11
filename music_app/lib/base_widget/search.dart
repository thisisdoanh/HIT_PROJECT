import 'package:flutter/material.dart';
import 'package:music_app/base_widget/text_form_field_surfix_icon.dart';
import 'package:music_app/const/color.dart';
import 'package:music_app/const/string.dart';
import 'package:music_app/screens/home/component/api_find_song.dart';

import '../const/component.dart';
import '../const/dimen.dart';

class BaseSearchBar extends StatelessWidget {
  BaseSearchBar({super.key, required this.controller});
  final TextEditingController controller;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: StringConst.textSearch,
            fillColor: ColorConst.primaryColorTextFormField,
            hintStyle: Component.textStyleTextFormField,
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(Dimen.borderRadiusTextFormField),
            ),
            suffixIcon: Icon(
              Icons.search_rounded,
              color: Colors.orange[900],
            ),
          ),
          readOnly: false,
          onFieldSubmitted: (value) {
            _submitForm();
          },
        ),
      ),
    );

    // return SizedBox(
    //   width: MediaQuery.of(context).size.width * 0.9,
    //   child:  BaseTextformFieldSurfixIcon(
    //     controller: controller,
    //     text: StringConst.textSearch,
    //     function: function,
    //     validator: (value) {},
    //     isReadOnly: false,
    //     surfixIcon: Icon(
    //       Icons.search_rounded,
    //       color: Colors.orange[900],
    //     ),
    //   ),
    // );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ApiFindSong().findSong(controller.text);
    }
  }
}
