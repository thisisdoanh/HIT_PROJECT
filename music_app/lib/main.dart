import 'package:flutter/material.dart';
import 'package:music_app/a.dart';
import 'package:music_app/welcome_screen.dart';
import 'package:music_app/const/component.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return Component.navigate(const WelcomeScreen());
          case '/detail':
            return Component.navigate(const MyWidget());
          default:
            return null;
        }
      },
    );
  }

  
}
