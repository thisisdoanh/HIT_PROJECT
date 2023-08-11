import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:music_app/base_widget/button.dart';
import 'package:music_app/base_widget/image.dart';
import 'package:music_app/const/component.dart';
import 'package:music_app/const/dimen.dart';
import 'package:music_app/const/routes_screen.dart';
import 'package:music_app/const/string.dart';
import 'package:music_app/data_api/data_api.dart';
import 'package:music_app/screens/profile/component/api_info.dart';
import 'package:music_app/screens/profile/component/appbar_setting.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  static List<bool> modeDarkLight = [true, false];
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  dynamic check;
  @override
  void initState() {
    _init();
    super.initState();
  }

  Future<void> _init() async {
    await ApiInfo().getInfo();
    await Future.delayed(
      Duration.zero,
      () {
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //   future: check,
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Scaffold(
    //         body: Center(
    //           child: CircularProgressIndicator(),
    //         ),
    //       );
    //     } else {
    //       return ;
    //     }
    //   },
    // );
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      appBar: const AppBarProfile(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
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
                    borderRadius: Dimen.borderRadiusImage * 1.2,
                  ),
                  const SizedBox(
                    height: Dimen.sizedBoxMedium,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "${DataApi.user!.firstName} ${DataApi.user!.lastName}",
                            style: Component.textStyleTextTittle,
                          ),
                          Text(
                            DataApi.user!.isEmailVerified
                                ? "Đã xác thực"
                                : "Chưa xác thực",
                          ),
                        ],
                      ),
                      BaseButton(
                        text: 'Sửa',
                        function: () {},
                        height: Dimen.heightIconSignUp,
                        width: MediaQuery.of(context).size.width * 0.1,
                        textStyle: Component.textStyleTextButtonSmall,
                        borderRadius: Dimen.borderRadiusButtonSmall,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: Dimen.sizedBoxSmall,
                  ),
                  Text(
                    "Username: ${DataApi.user!.username}",
                    style: Component.textStyleText,
                  ),
                  const SizedBox(
                    height: Dimen.sizedBoxSmall,
                  ),
                ]),
              ),
              const SizedBox(
                height: Dimen.sizedBoxSmall,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Email: ${DataApi.user!.email}",
                    style: Component.textStyleText,
                  ),
                  const SizedBox(
                    height: Dimen.sizedBoxSmall,
                  ),
                  Text(
                    "Giới tính: ${DataApi.user!.gender}",
                    style: Component.textStyleText,
                  ),
                  const SizedBox(
                    height: Dimen.sizedBoxSmall,
                  ),
                  Text(
                    "Ngày sinh: ${DateFormat('dd/MM/yyyy').format(DataApi.user!.dateOfBirth)}",
                    style: Component.textStyleText,
                  ),
                ],
              ),
              const SizedBox(height: Dimen.sizedBoxMedium),
            ],
          ),
        ],
      ),
    );
  }
}
