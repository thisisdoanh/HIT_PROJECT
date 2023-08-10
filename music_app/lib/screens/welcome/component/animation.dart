// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:music_app/const/component.dart';
import 'package:music_app/const/dimen.dart';
import 'package:music_app/const/routes_screen.dart';
import 'package:music_app/const/string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnimationWelcome extends StatefulWidget {
  const AnimationWelcome({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AnimationWelcomeState createState() => _AnimationWelcomeState();
}

class _AnimationWelcomeState extends State<AnimationWelcome>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();

    // waitSplashScreen();
  }

  void waitSplashScreen() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );

    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool isFirstOpen = preferences.getBool('isFirstOpen') ?? true;

    isFirstOpen ? Navigator.pushReplacementNamed(context, RoutesScreen.routesOnboarding1) : Navigator.pushReplacementNamed(context, RoutesScreen.routesSignIn); 
    
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: _animation.value * MediaQuery.of(context).size.width / 2 -
              const Offset(Dimen.appIconSize, Dimen.appIconSize) +
              Offset(MediaQuery.of(context).size.width / 2,
                  MediaQuery.of(context).size.height / 2),
          child: SizedBox(
            width: Dimen.appIconSize * 2,
            child: Column(
              children: [
                Container(
                  width: Dimen.appIconSize,
                  height: Dimen.appIconSize,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        StringConst.assetImgAppIcon,
                      ),
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(
                  height: Dimen.sizedBoxSmall,
                ),
                const Text(
                  StringConst.appName,
                  style: Component.textStyleAppName,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
