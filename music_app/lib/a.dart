import 'package:flutter/material.dart';
import 'package:music_app/base_widget/text_form_field.dart';
import 'package:music_app/const/dimen.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              BaseTextFormField(
                text: 'Input',
                height: 47,
                width: Dimen.widthFullScreen,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
