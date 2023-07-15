import 'package:flutter/material.dart';
import 'package:music_app/base_widget/button.dart';
import 'package:music_app/base_widget/image.dart';
import 'package:music_app/base_widget/text.dart';
import 'package:music_app/base_widget/text_form_field.dart';
import 'package:music_app/base_widget/text_tittle.dart';
import 'package:music_app/const/component.dart';
import 'package:music_app/const/dimen.dart';
import 'package:music_app/const/routes_screen.dart';
import 'package:music_app/const/string.dart';

class SignUp1Screen extends StatelessWidget {
  SignUp1Screen({super.key});

  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPass = TextEditingController();
  final TextEditingController controllerPassAgin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: keyForm,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
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
                ),
                const SizedBox(
                  height: Dimen.sizedBoxSmall,
                ),
                const BaseTextTittle(
                  text: StringConst.textSignUp,
                  width: Dimen.widthTextTittlt,
                  textStyle: Component.textStyleTextTittle,
                ),
                const SizedBox(
                  height: Dimen.sizedBoxSmall,
                ),
                const BaseText(
                  text: StringConst.textHello,
                  padding: Dimen.padding0,
                  textStyle: Component.textStyleText,
                ),
                const SizedBox(
                  height: Dimen.sizedBoxSmall,
                ),
                BaseTextFormField(
                  controller: controllerName,
                  text: StringConst.textYourName,
                  width: MediaQuery.of(context).size.width * 0.95,
                  validator: (value) {
                    if (value == '') {
                      return 'Name not entered yet';
                    }

                    if (RegExp(r'[^\w\s]').hasMatch(value)) {
                      return 'Name cannot contain numbers and special characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: Dimen.sizedBoxSmall,
                ),
                BaseTextFormField(
                  controller: controllerEmail,
                  text: StringConst.textYourEmail,
                  width: MediaQuery.of(context).size.width * 0.95,
                  validator: (value) {
                    if (value == '') {
                      return 'Email not entered yet';
                    }

                    if (!value.toString().contains('@gmail.com')) {
                      return 'Email must to be abc@gmail.com';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: Dimen.sizedBoxSmall,
                ),
                BaseTextFormField(
                  controller: controllerPass,
                  text: StringConst.textPass,
                  width: MediaQuery.of(context).size.width * 0.95,
                  validator: (value) {
                    if (value == '') {
                      return 'Password not entered yet';
                    }

                    if (!RegExp(r'[^\w\s]').hasMatch(value)) {
                      return 'Password must contain numbers and special characters';
                    }

                    if (value.toString().length < 8) {
                      return 'Password must be at least 8 characters long';
                    }

                    if (controllerPass.text != controllerPassAgin.text) {
                      return 'Password does not match';
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: Dimen.sizedBoxSmall,
                ),
                BaseTextFormField(
                  controller: controllerPassAgin,
                  text: StringConst.textPass,
                  width: MediaQuery.of(context).size.width * 0.95,
                  validator: (value) {
                    if (value == '') {
                      return 'Password not entered yet';
                    }

                    if (!RegExp(r'[^\w\s]').hasMatch(value)) {
                      return 'Password must contain numbers and special characters';
                    }

                    if (value.toString().length < 8) {
                      return 'Password must be at least 8 characters long';
                    }

                    if (controllerPass.text != controllerPassAgin.text) {
                      return 'Password does not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: Dimen.sizedBoxMedium * 2,
                ),
                Row(
                  children: [
                    BaseButton(
                      text: StringConst.signup,
                      function: () {
                        if (keyForm.currentState!.validate()) {
                          Navigator.pushNamed(
                              context, RoutesScreen.routesSignUp2);
                        }
                      },
                      height: Dimen.heightButtonLarge,
                      width: Dimen.widthButtonSmall,
                      textStyle: Component.textStyleTextButtonSmall,
                      borderRadius: Dimen.borderRadiusButtonSmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
