import 'package:flutter/material.dart';
import 'package:music_app/base_widget/button.dart';
import 'package:music_app/const/string.dart';
import 'package:music_app/const/component.dart';
import 'package:music_app/const/dimen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            SafeArea(
              child: Center(
                child: BaseButton(
                  text: String.next,
                  function: () => Navigator.pushNamed(context, '/detail'),
                  height: Dimen.heightButtonLarge,
                  width: Dimen.widthFullScreen,
                  textStyle: Component.textStyleButtonLarge,
                  borderRadius: Dimen.borderRadiusFullScreen,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
