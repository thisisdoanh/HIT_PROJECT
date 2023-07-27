import 'package:flutter/material.dart';
import 'package:music_app/base_widget/button.dart';
import 'package:music_app/base_widget/image.dart';
import 'package:music_app/const/component.dart';
import 'package:music_app/const/dimen.dart';
import 'package:music_app/const/routes_screen.dart';
import 'package:music_app/const/string.dart';
import 'package:music_app/data_api/data_user.dart';
import 'package:music_app/screens/setting/component/appbar_setting.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarSetting(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimen.paddingHorizontal,
          vertical: Dimen.paddingVertical,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(children: [
                const SizedBox(
                  height: Dimen.sizedBoxMedium * 2,
                ),
                BaseImageNetwork(
                  height: Dimen.sizeImageUser,
                  width: Dimen.sizeImageUser,
                  linkImage: DataUser.user!.avatar,
                  borderRadius: Dimen.borderRadiusImage,
                ),
                const SizedBox(
                  height: Dimen.sizedBoxMedium,
                ),
                Text(
                  "${DataUser.user!.firstName} ${DataUser.user!.lastName}",
                  style: Component.textStyleTextTittle,
                ),
              ]),
            ),
            const SizedBox(
              height: Dimen.sizedBoxMedium,
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
                  text: 'Đổi ảnh',
                  function: () {},
                  height: Dimen.heightIconSignUp,
                  width: MediaQuery.of(context).size.width * 0.4,
                  textStyle: Component.textStyleTextButtonSmall,
                  borderRadius: Dimen.borderRadiusButtonSmall,
                ),
              ],
            ),
            const SizedBox(
              height: Dimen.sizedBoxMedium,
            ),
            const Center(
              child: Text(
                'Thông tin tài khoản',
                style: Component.textStyleTittle,
              ),
            ),
            const SizedBox(
              height: Dimen.sizedBoxSmall,
            ),
            Text(
              "Email: ${DataUser.user!.email}",
              style: Component.textStyleTextButtonSmall,
            ),
            const SizedBox(
              height: Dimen.sizedBoxSmall,
            ),
            Text(
              "Giới tính: ${DataUser.user!.gender}",
              style: Component.textStyleTextButtonSmall,
            ),
            const SizedBox(
              height: Dimen.sizedBoxSmall,
            ),
            Text(
              "Ngày sinh: ${DataUser.user!.dateOfBirth}",
              style: Component.textStyleTextButtonSmall,
            ),
          ],
        ),
      ),
    );
  }
}
