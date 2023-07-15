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

part 'component/function.dart';

class SignUp2Screen extends StatefulWidget {
  const SignUp2Screen({super.key});

  @override
  State<SignUp2Screen> createState() => _SignUp2ScreenState();
}

class _SignUp2ScreenState extends State<SignUp2Screen> {
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  final TextEditingController controllerNickname = TextEditingController();

  final TextEditingController controllerDate = TextEditingController();

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
                  controller: controllerNickname,
                  text: StringConst.textNickname,
                  width: MediaQuery.of(context).size.width * 0.95,
                  validator: (value) {
                    if (value == '') {
                      return 'Nickname not entered yet';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: Dimen.sizedBoxSmall,
                ),
                // TextFormField(
                //   controller: controllerDate,
                //   decoration: InputDecoration(
                //     labelText: 'Date of birth',
                //     suffixIcon: IconButton(
                //       icon: Icon(Icons.calendar_today),
                //       onPressed: () => _selectDate(context),
                //     ),
                //   ),
                //   readOnly: true,
                //   onTap: () => _selectDate(context),
                //   validator: (value) {
                //     if (value == '') {
                //       return 'Date of birth not entered yet';
                //     }
                //     return null;
                //   },
                // ),
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
