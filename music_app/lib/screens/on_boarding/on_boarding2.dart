import 'package:flutter/material.dart';
import 'package:music_app/base_widget/button.dart';
import 'package:music_app/base_widget/text.dart';
import 'package:music_app/const/component.dart';
import 'package:music_app/const/dimen.dart';
import 'package:music_app/const/routes_screen.dart';
import 'package:music_app/const/string.dart';
import 'package:music_app/screens/on_boarding/controller/animation.dart';

class OnBoarding2Screen extends StatelessWidget {
  const OnBoarding2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          const AnimationOnboarding(assetImage: StringConst.assetImgOnboarding2,),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          const BaseText(
            text: StringConst.textOnboarding2,
            padding: Dimen.padding,
            textStyle: Component.textStyleText,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Center(
            child: BaseButton(
              text: StringConst.next,
              function: () => Navigator.pushReplacementNamed(context, RoutesScreen.routesOnboarding3),
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
