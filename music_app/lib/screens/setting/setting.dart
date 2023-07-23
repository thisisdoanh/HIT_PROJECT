import 'package:flutter/material.dart';
import 'package:music_app/base_widget/button.dart';
import 'package:music_app/base_widget/image.dart';
import 'package:music_app/const/component.dart';
import 'package:music_app/const/dimen.dart';
import 'package:music_app/const/routes_screen.dart';
import 'package:music_app/const/string.dart';
import 'package:music_app/screens/setting/component/appbar_setting.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarSetting(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: Dimen.sizedBoxMedium * 2,
            ),
            const BaseImage(
              height: Dimen.sizeImageUser,
              width: Dimen.sizeImageUser,
              assetImage: StringConst.assetImgWelcome,
              borderRadius: Dimen.borderRadiusImage,
            ),
            const SizedBox(
              height: Dimen.sizedBoxSmall,
            ),
            const Text(
              'aa',
              style: Component.textStyleText,
            ),
            const SizedBox(
              height: Dimen.sizedBoxSmall,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BaseButton(
                  text: 'Log Out',
                  function: () => Navigator.of(context).pushNamedAndRemoveUntil(
                      RoutesScreen.routesSignUp1, (route) => false),
                  height: Dimen.heightIconSignUp,
                  width: MediaQuery.of(context).size.width * 0.4,
                  textStyle: Component.textStyleTextButtonSmall,
                  borderRadius: Dimen.borderRadiusButtonSmall,
                ),
                BaseButton(
                  text: 'Đổi thông tin',
                  function: () {},
                  height: Dimen.heightIconSignUp,
                  width: MediaQuery.of(context).size.width * 0.4,
                  textStyle: Component.textStyleTextButtonSmall,
                  borderRadius: Dimen.borderRadiusButtonSmall,
                ),
              ],
            ),
            const Text(
              'Setting',
              style: Component.textStyleTittle,
            ),

          ],
        ),
      ),
    );
  }
}
