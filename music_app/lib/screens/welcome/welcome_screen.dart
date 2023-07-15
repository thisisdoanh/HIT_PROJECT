import 'package:flutter/material.dart';
import 'package:music_app/const/string.dart';
import 'package:music_app/screens/welcome/component/animation.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Image.asset(
              StringConst.assetImgWelcome,
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
