// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/base_widget/button.dart';
import 'package:music_app/base_widget/image.dart';
import 'package:music_app/base_widget/text_form_field.dart';
import 'package:music_app/const/component.dart';
import 'package:music_app/const/dimen.dart';
import 'package:music_app/const/routes_screen.dart';
import 'package:music_app/const/string.dart';
import 'package:music_app/screens/forget_password/component/api_forget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  final TextEditingController controllerUserName = TextEditingController();
  final TextEditingController controllerOTP = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(
          vertical: Dimen.paddingVertical,
          horizontal: Dimen.paddingHorizontal,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                StringConst.assetImgSignup,
              ),
              fit: BoxFit.fill),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            const BaseImage(
              height: Dimen.appIconSize,
              width: Dimen.appIconSize,
              assetImage: StringConst.assetImgAppIcon,
              borderRadius: Dimen.borderRadiusImage,
            ),
            const SizedBox(
              height: Dimen.sizedBoxMedium,
            ),
            BaseTextFormField(
              text: 'Nhập email',
              width: MediaQuery.of(context).size.width * 0.95,
              validator: (value) {},
              controller: controllerUserName,
              textInputType: TextInputType.text,
              isHide: false,
            ),
            const SizedBox(
              height: Dimen.sizedBoxMedium,
            ),
            Center(
              child: BaseButton(
                text: StringConst.next,
                function: () async {
                  var response = await ApiForgetPassword()
                      .forgetAccount(controllerUserName.text, context);

                  if (response != null) {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: 230,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text('Nhập OTP'),
                              const SizedBox(
                                height: Dimen.sizedBoxSmall,
                              ),
                              const Divider(),
                              const SizedBox(
                                height: Dimen.sizedBoxSmall,
                              ),
                              BaseTextFormField(
                                text: 'Nhập OTP',
                                width: MediaQuery.of(context).size.width * 0.9,
                                validator: (value) {},
                                controller: controllerOTP,
                                textInputType: TextInputType.number,
                                isHide: false,
                              ),
                              const SizedBox(
                                height: Dimen.sizedBoxSmall * 1.5,
                              ),
                              Center(
                                child: BaseButton(
                                  text: StringConst.next,
                                  function: () async {
                                    var responseConfirmOTP =
                                        await ApiForgetPassword().verifyOtp(
                                            controllerUserName.text,
                                            controllerOTP.text,
                                            context);
                                    if (responseConfirmOTP == true) {
                                      Navigator.pop(context);
                                      Navigator.pushNamed(
                                        context,
                                        RoutesScreen.routesResetPassword,
                                        arguments: controllerUserName.text,
                                      );
                                    }
                                    controllerOTP.clear();
                                  },
                                  height: Dimen.heightButtonLarge,
                                  width: Dimen.widthButtonSmall,
                                  textStyle: Component.textStyleTextButtonSmall,
                                  borderRadius: 20,
                                ),
                              ),
                              Text(
                                "Note: $response",
                                style: Component.textStyleText,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                },
                height: Dimen.heightButtonLarge,
                width: Dimen.widthButtonSmall,
                textStyle: Component.textStyleTextButtonSmall,
                borderRadius: Dimen.borderRadiusButtonSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
