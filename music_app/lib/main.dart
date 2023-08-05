import 'package:flutter/material.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:music_app/const/routes_screen.dart';
import 'package:music_app/data_api/data_api.dart';
import 'package:music_app/screens/home/home.dart';
import 'package:music_app/screens/on_boarding/on_boarding1.dart';
import 'package:music_app/screens/on_boarding/on_boarding2.dart';
import 'package:music_app/screens/on_boarding/on_boarding3.dart';
import 'package:music_app/screens/playing/playing.dart';
import 'package:music_app/screens/setting/setting.dart';
import 'package:music_app/screens/sign_in/sign_in.dart';
import 'package:music_app/screens/sign_up/sign_up1.dart';
import 'package:music_app/screens/sign_up/sign_up2.dart';
import 'package:music_app/screens/welcome/welcome_screen.dart';
import 'package:music_app/const/component.dart';
import 'package:provider/provider.dart';
import 'package:music_app/controller.dart';
import 'test.dart';

Future<void> main() async {
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
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

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesScreen.routesWelcome,
        // initialRoute: '/test',
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
            case RoutesScreen.routesSignUp1:
              return Component().navigate(SignUp1Screen());
            case RoutesScreen.routesSignUp2:
              return Component()
                  .navigate(const SignUp2Screen(), settings.arguments);
            case RoutesScreen.routesHome:
              return Component().navigate(const HomeScreen());
            case RoutesScreen.routesSignIn:
              return Component().navigate(SignInScreen());
            case RoutesScreen.routesProfile:
              return MaterialPageRoute(
                builder: (context) => const Profile(),
              );
            case '/test':
              return Component()
                  .navigate(PlayMusicScreen(), settings.arguments);
            default:
              return null;
          }
        },
      ),
    );
  }
}
