// ignore_for_file: use_build_context_synchronously, must_be_immutable

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
import 'package:music_app/controller.dart';
import 'package:music_app/data_api/data_api.dart';
import 'package:music_app/screens/playing/component/api_playing.dart';
import 'package:music_app/screens/sign_in/component/api_login.dart';
import 'package:music_app/screens/sign_in/component/google_sign_in_provider.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  final TextEditingController controllerUsername = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  dynamic check;
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
                  validator: (value) {
                    return null;
                  },
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
                  validator: (value) {
                    return null;
                  },
                  controller: controllerPassword,
                  textInputType: TextInputType.text,
                  isHide: true,
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
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      RoutesScreen.routesForgotPass,
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BaseButton(
                      text: StringConst.signIn,
                      function: () async {
                        var response = await ApiLogin().getAccount(
                          controllerUsername.text,
                          controllerPassword.text,
                        );

                        response != null
                            ? {DataApi.user = response, check = true}
                            : check = false;
                        check ??= false;
                        DataApi.song = await ApiPlaying().getSong();

                        if (keyForm.currentState!.validate() &&
                            check != false) {
                          // SharedPreferences preferences =
                          // await SharedPreferences.getInstance();
                          // preferences.setString('accessToken', DataApi.accessToken);
                          // context.read<Controller>().startAudioPlayer();
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
                          function: () {
                            final provider = Provider.of<GoogleSignInProvider>(
                                context,
                                listen: false);
                            provider.googleLogin();
                          },
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      StringConst.textGoToSignUp,
                      style: Component.textStyleText,
                    ),
                    CupertinoButton(
                      padding: const EdgeInsets.all(Dimen.padding0),
                      child: const Text(
                        StringConst.signup,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                            context, RoutesScreen.routesSignUp1);
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
