import 'package:flutter/material.dart';
import 'package:music_app/const/routes_screen.dart';
import 'package:music_app/screens/home/home.dart';
import 'package:music_app/screens/on_boarding/on_boarding1.dart';
import 'package:music_app/screens/on_boarding/on_boarding2.dart';
import 'package:music_app/screens/on_boarding/on_boarding3.dart';
import 'package:music_app/screens/sign_up/sign_up1.dart';
import 'package:music_app/screens/sign_up/sign_up2.dart';
import 'package:music_app/screens/welcome/welcome_screen.dart';
import 'package:music_app/const/component.dart';
import 'package:music_app/test.dart';
import 'package:provider/provider.dart';
import 'package:music_app/controller.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Controller()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      // initialRoute: RoutesScreen.routesSignUp1,
      // onGenerateRoute: (settings) {
      //   switch (settings.name) {
      //     case RoutesScreen.routesWelcome:
      //       return Component().navigate(const WelcomeScreen());
      //     case RoutesScreen.routesOnboarding1:
      //       return Component().navigate(const OnBoarding1Screen());
      //     case RoutesScreen.routesOnboarding2:
      //       return Component().navigate(const OnBoarding2Screen());
      //     case RoutesScreen.routesOnboarding3:
      //       return Component().navigate(const OnBoarding3Screen());
      //     case RoutesScreen.routesSignUp1:
      //       return Component().navigate(SignUp1Screen());
      //     case RoutesScreen.routesSignUp2:
      //       return Component().navigate(const SignUp2Screen());
      //     case RoutesScreen.routesHome:
      //       return Component().navigate(HomeScreen());
      //     case '/test':
      //       return Component().navigate(const Test());
      //     default:
      //       return null;
      //   }
      // },
      home: HomeScreen(),
    );
  }
}
