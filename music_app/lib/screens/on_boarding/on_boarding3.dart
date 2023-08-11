// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:music_app/base_widget/button.dart';
import 'package:music_app/base_widget/text.dart';
import 'package:music_app/const/component.dart';
import 'package:music_app/const/dimen.dart';
import 'package:music_app/const/routes_screen.dart';
import 'package:music_app/const/string.dart';
import 'package:music_app/screens/on_boarding/component/animation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding3Screen extends StatelessWidget {
  const OnBoarding3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          const AnimationOnboarding(
            assetImage: StringConst.assetImgOnboarding3,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          const BaseText(
            text: StringConst.textOnboarding3,
            padding: Dimen.padding,
            textStyle: Component.textStyleText,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Center(
            child: BaseButton(
              text: StringConst.next,
              function: () async {
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                preferences.setBool('isFirstOpen', false);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RoutesScreen.routesSignUp1,
                  (route) => false,
                );
              },
              height: Dimen.heightButtonLarge,
              width: MediaQuery.of(context).size.width * 0.95,
              textStyle: Component.textStyleButtonLarge,
              borderRadius: Dimen.borderRadiusFullScreen,
            ),
          ),
        ],
      ),
    );
  }
}
