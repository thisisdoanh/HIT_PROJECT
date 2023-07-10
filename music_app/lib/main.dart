import 'package:flutter/material.dart';
import 'package:music_app/base_widget/button.dart';
import 'package:music_app/welcome_screen.dart';
import 'package:music_app/const/string.dart';
import 'package:music_app/const/component.dart';
import 'package:music_app/const/dimen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    void navigate(Widget a) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => a,
        ),
      );
    }

    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Center(
          child: Button(
            text: String.next,
            function: () => navigate(WelcomeScreen()),
            height: Dimen.heightButtonLarge,
            width: Dimen.widthButtonLarge,
            textStyle: Component.textStyleButtonLarge,
          ),
        ),
      ),
    );
  }
}
