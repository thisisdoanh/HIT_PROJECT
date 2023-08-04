import 'package:flutter/material.dart';
import 'package:music_app/base_widget/button.dart';
import 'package:music_app/base_widget/image.dart';
import 'package:music_app/const/component.dart';
import 'package:music_app/const/dimen.dart';
import 'package:music_app/const/routes_screen.dart';
import 'package:music_app/const/string.dart';
import 'package:music_app/data_api/data_api.dart';
import 'package:music_app/screens/setting/component/appbar_setting.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  static List<bool> modeDarkLight = [true, false];
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarSetting(),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Center(
              child: Column(children: [
                const SizedBox(
                  height: Dimen.sizedBoxMedium * 2,
                ),
                BaseImageNetwork(
                  height: Dimen.sizeImageUser,
                  width: Dimen.sizeImageUser,
                  linkImage: DataApi.user!.avatar,
                  borderRadius: Dimen.borderRadiusImage,
                ),
                const SizedBox(
                  height: Dimen.sizedBoxMedium,
                ),
                Text(
                  "${DataApi.user!.firstName} ${DataApi.user!.lastName}",
                  style: Component.textStyleTextTittle,
                ),
              ]),

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
              "Email: ${DataApi.user!.email}",
              style: Component.textStyleTextButtonSmall,
            ),
            const SizedBox(
              height: Dimen.sizedBoxSmall,
            ),
            Text(
              "Giới tính: ${DataApi.user!.gender}",
              style: Component.textStyleTextButtonSmall,
            ),
            const SizedBox(
              height: Dimen.sizedBoxSmall,
            ),
            Text(
              "Ngày sinh: ${DataApi.user!.dateOfBirth}",
              style: Component.textStyleTextButtonSmall,
            ),
            const SizedBox(height: Dimen.sizedBoxMedium),
            const Center(
              child: Text(
                "Setting",
                style: Component.textStyleTextButtonSmall,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  StringConst.textModeLightDark,
                  style: Component.textStyleTittle,
                ),
                ToggleButtons(
                  onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < Profile.modeDarkLight.length; i++) {
                        Profile.modeDarkLight[i] = i == index;
                      }
                    });
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  selectedBorderColor: Colors.blue[700],
                  selectedColor: Colors.white,
                  fillColor: Colors.orange[400],
                  color: Colors.blue[400],
                  isSelected: Profile.modeDarkLight,
                  children: const [
                    Icon(Icons.wb_sunny_outlined),
                    Icon(Icons.mode_night_outlined),
                  ],
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
