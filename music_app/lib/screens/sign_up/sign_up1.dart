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
import 'package:flutter/cupertino.dart';

class SignUp1Screen extends StatelessWidget {
  SignUp1Screen({super.key});

  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  final TextEditingController controllerFirstName = TextEditingController();
  final TextEditingController controllerLastName = TextEditingController();
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
                  text: StringConst.textHello,
                  padding: Dimen.padding0,
                  textStyle: Component.textStyleText,
                ),
                const SizedBox(
                  height: Dimen.sizedBoxSmall,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BaseTextFormField(
                      controller: controllerFirstName,
                      text: StringConst.textYourFirstName,
                      width: MediaQuery.of(context).size.width * 0.9 / 2,
                      validator: (value) {
                        if (value == '') {
                          return StringConst.notiErrorFirstName[0];
                        }

                        return null;
                      },
                      textInputType: TextInputType.text,
                      isHide: false,
                    ),
                    BaseTextFormField(
                      textInputType: TextInputType.text,
                      isHide: false,
                      controller: controllerLastName,
                      text: StringConst.textYourLastName,
                      width: MediaQuery.of(context).size.width * 0.9 / 2,
                      validator: (value) {
                        if (value == '') {
                          return StringConst.notiErrorLastName[0];
                        }

                        return null;
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: Dimen.sizedBoxSmall,
                ),
                BaseTextFormField(
                  textInputType: TextInputType.emailAddress,
                  isHide: false,
                  controller: controllerEmail,
                  text: StringConst.textYourEmail,
                  width: MediaQuery.of(context).size.width * 0.95,
                  validator: (value) {
                    if (value == '') {
                      return StringConst.notiErrorEmail[0];
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: Dimen.sizedBoxSmall,
                ),
                BaseTextFormField(
                  textInputType: TextInputType.text,
                  isHide: true,
                  controller: controllerPass,
                  text: StringConst.textPass,
                  width: MediaQuery.of(context).size.width * 0.95,
                  validator: (value) {
                    if (value == '') {
                      return StringConst.notiErrorPassword[0];
                    }

                    if (controllerPass.text != controllerPassAgin.text) {
                      return StringConst.notiErrorPassword[3];
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
                      return StringConst.notiErrorPassword[0];
                    }

                    if (controllerPass.text != controllerPassAgin.text) {
                      return StringConst.notiErrorPassword[3];
                    }
                    return null;
                  },
                  isHide: true,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(
                  height: Dimen.sizedBoxSmall,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BaseButton(
                      text: StringConst.signup,
                      function: () {
                        if (keyForm.currentState!.validate()) {
                          Map<String, String> dataSignUp1 = {
                            'firstName': controllerFirstName.text,
                            'lastName': controllerLastName.text,
                            'email': controllerEmail.text,
                            'password': controllerPass.text,
                          };
                          Navigator.pushNamed(
                            context,
                            RoutesScreen.routesSignUp2,
                            arguments: dataSignUp1,
                          );
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
                const SizedBox(
                  height: Dimen.sizedBoxMedium,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      StringConst.textGoToSignIn,
                      style: Component.textStyleText,
                    ),
                    CupertinoButton(
                      padding: const EdgeInsets.all(Dimen.padding0),
                      child: const Text(
                        StringConst.signIn,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesScreen.routesSignIn);
                      },
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
