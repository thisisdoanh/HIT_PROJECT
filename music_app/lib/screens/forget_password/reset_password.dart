// ignore_for_file: use_build_context_synchronously, unused_result
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:music_app/base_widget/button.dart';
import 'package:music_app/base_widget/image.dart';
import 'package:music_app/base_widget/text_form_field.dart';
import 'package:music_app/const/component.dart';
import 'package:music_app/const/dimen.dart';
import 'package:music_app/const/string.dart';
import 'package:music_app/screens/forget_password/component/api_forget.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final TextEditingController controllerPass = TextEditingController();
  final TextEditingController controllerConfirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;
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
          mainAxisAlignment: MainAxisAlignment.start,
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
            const SizedBox(
              height: Dimen.sizedBoxSmall,
            ),
            BaseTextFormField(
              text: StringConst.textPass,
              width: MediaQuery.of(context).size.width * 0.95,
              validator: (value) {
                return null;
              },
              controller: controllerPass,
              textInputType: TextInputType.text,
              isHide: false,
            ),
            const SizedBox(
              height: Dimen.sizedBoxSmall,
            ),
            BaseTextFormField(
              text: StringConst.textPass,
              width: MediaQuery.of(context).size.width * 0.95,
              validator: (value) {
                return null;
              },
              controller: controllerConfirmPass,
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
                  var response = await ApiForgetPassword().resetPassOtp(
                    email,
                    controllerPass.text,
                    controllerConfirmPass.text,
                    context,
                  );

                  if (response != null) {
                    showAlertDialog(
                      context: context,
                      builder: (context, child) {
                        return AlertDialog(
                          title: const Text('Done'),
                          content: Text(response),
                          actions: <Widget>[
                            ElevatedButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                height: Dimen.heightButtonLarge,
                width: Dimen.widthButtonSmall,
                textStyle: Component.textStyleTextButtonSmall,
                borderRadius: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
