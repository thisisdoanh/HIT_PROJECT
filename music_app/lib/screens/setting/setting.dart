import 'package:flutter/material.dart';
import 'package:music_app/base_widget/button.dart';
import 'package:music_app/base_widget/image.dart';
import 'package:music_app/const/color.dart';
import 'package:music_app/const/dimen.dart';
import 'package:music_app/controller.dart';
import 'package:music_app/data_api/data_api.dart';
import 'package:music_app/screens/setting/component/app_bar_setting.dart';
import 'package:music_app/screens/sign_in/sign_in.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../const/component.dart';
import '../../const/routes_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarSetting(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 4, color: ColorConst.colorText),
                  borderRadius:
                      BorderRadius.circular(Dimen.borderRadiusImage + 4)),
              child: BaseImageNetwork(
                height: Dimen.sizeImageUser * 0.8,
                width: Dimen.sizeImageUser * 0.8,
                linkImage: DataApi.user!.avatar,
                borderRadius: Dimen.borderRadiusImage - 4,
              ),
            ),
            const SizedBox(
              height: Dimen.sizedBoxMedium,
            ),
            Text(
              "${DataApi.user!.firstName} ${DataApi.user!.lastName}",
              style: Component.textStyleTextTittle,
            ),
            const SizedBox(
              height: Dimen.sizedBoxSmall,
            ),
            Text(
              DataApi.user!.email,
              style: Component.textStyleText,
            ),
            const SizedBox(
              height: Dimen.sizedBoxSmall,
            ),
            BaseButton(
              text: 'Log Out',
              function: () {
                AudioManager().reset();
                SongManager().reset();
                DataApi().reset();
                // Navigator.pop(context);
                // Navigator.of(context).pushAndRemoveUntil(
                //     CupertinoPageRoute(
                //       builder: (context) => SignInScreen(),
                //     ),
                //     (route) => false);
                PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                    context,
                    screen: SignInScreen(),
                    settings: const RouteSettings(
                      name: RoutesScreen.routesSignIn,
                    ),
                    withNavBar: false);
                // Navigator.pushNamedAndRemoveUntil(
                //   context,
                //   RoutesScreen.routesSignIn,
                //   (route) => false,
                // );
              },
              height: 50,
              width: 93,
              textStyle: const TextStyle(
                color: ColorConst.colorText,
                fontFamily: 'inter',
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              borderRadius: 20,
            )
          ],
        ),
      ),
    );
  }
}
