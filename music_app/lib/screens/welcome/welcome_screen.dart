import 'package:flutter/material.dart';
import 'package:music_app/screens/welcome/controller/animation.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/images/welcome_screen.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.fill,
            ),
            const Positioned(
              child: AnimationWelcome(),
            ),
          ],
        ),
    );
  }
}
