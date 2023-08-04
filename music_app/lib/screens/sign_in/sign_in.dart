import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/base_widget/button.dart';
import 'package:music_app/base_widget/icon.dart';
import 'package:music_app/base_widget/image.dart';
import 'package:music_app/base_widget/text.dart';
import 'package:music_app/base_widget/text_form_field.dart';
import 'package:music_app/base_widget/text_tittle.dart';
import 'package:music_app/const/component.dart';
import 'package:music_app/const/dimen.dart';
import 'package:music_app/const/routes_screen.dart';
import 'package:music_app/const/string.dart';
import 'package:music_app/models/user.dart';
import 'package:music_app/screens/sign_in/component/api_login.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  final TextEditingController controllerUsername = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
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
                  borderRadius: Dimen.borderRadiusImage,
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
                  text: StringConst.textHelloSignIn,
                  padding: Dimen.padding0,
                  textStyle: Component.textStyleText,
                ),
                const SizedBox(
                  height: Dimen.sizedBoxSmall,
                ),
                BaseTextFormField(
                  text: StringConst.textUsername,
                  width: MediaQuery.of(context).size.width * 0.95,
                  validator: (value) {},
                  controller: controllerUsername,
                  textInputType: TextInputType.text,
                  isHide: false,
                ),
                const SizedBox(
                  height: Dimen.sizedBoxSmall,
                ),
                BaseTextFormField(
                  text: StringConst.textPass,
                  width: MediaQuery.of(context).size.width * 0.95,
                  validator: (value) {},
                  controller: controllerPassword,
                  textInputType: TextInputType.text,
                  isHide: false,
                ),
                const SizedBox(
                  height: Dimen.sizedBoxSmall,
                ),
                CupertinoButton(
                  padding: const EdgeInsets.all(Dimen.padding0),
                  child: const Text(
                    StringConst.textForgotPassword,
                    style: Component.textStyleText,
                  ),
                  onPressed: () {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BaseButton(
                      text: StringConst.signIn,
                      function: () async {
                        print("helo1");
                        var response = await ApiLogin().getAccount(
                          "admin",
                          "superadmin123",
                        );

                        print("/n test");
                        print("helo2");
                        if (keyForm.currentState!.validate()) {
                          Navigator.pushNamed(context, RoutesScreen.routesHome);
                        }
                      },
                      height: Dimen.heightButtonLarge,
                      width: Dimen.widthButtonSmall,
                      textStyle: Component.textStyleTextButtonSmall,
                      borderRadius: Dimen.borderRadiusButtonSmall,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BaseIcon(
                          assetName: StringConst.assetIconGmail,
                          height: Dimen.heightIconSignUp,
                          width: Dimen.widthIconSignUp,
                          function: () {},
                        ),
                        BaseIcon(
                          assetName: StringConst.assetIconFacebook,
                          height: Dimen.widthIconSignUp,
                          width: Dimen.widthIconSignUp,
                          function: () {},
                        ),
                        BaseIcon(
                          assetName: StringConst.assetIconTwitter,
                          height: Dimen.widthIconSignUp,
                          width: Dimen.widthIconSignUp,
                          function: () {},
                        ),
                      ],
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