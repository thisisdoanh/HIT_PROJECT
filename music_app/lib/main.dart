import 'package:flutter/material.dart';
import 'package:music_app/const/routes_screen.dart';
import 'package:music_app/screens/on_boarding/on_boarding1.dart';
import 'package:music_app/screens/on_boarding/on_boarding2.dart';
import 'package:music_app/screens/on_boarding/on_boarding3.dart';
import 'package:music_app/screens/welcome/welcome_screen.dart';
import 'package:music_app/const/component.dart';
import 'package:music_app/test.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: RoutesScreen.routesWelcome,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case RoutesScreen.routesWelcome:
            return Component().navigate(const WelcomeScreen());
          case RoutesScreen.routesOnboarding1:
            return Component().navigate(const OnBoarding1Screen());
          case RoutesScreen.routesOnboarding2:
            return Component().navigate(const OnBoarding2Screen());
          case RoutesScreen.routesOnboarding3:
            return Component().navigate(const OnBoarding3Screen());
          case '/test':
            return Component().navigate(const Test());
          default:
            return null;
        }
      },
    );
  }
}
