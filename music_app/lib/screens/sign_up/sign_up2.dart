import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:music_app/base_widget/button.dart';
import 'package:music_app/base_widget/icon.dart';
import 'package:music_app/base_widget/image.dart';
import 'package:music_app/base_widget/text.dart';
import 'package:music_app/base_widget/text_form_field.dart';
import 'package:music_app/base_widget/text_form_field_surfix_icon.dart';
import 'package:music_app/base_widget/text_tittle.dart';
import 'package:music_app/const/color.dart';
import 'package:music_app/const/component.dart';
import 'package:music_app/const/dimen.dart';
import 'package:music_app/const/routes_screen.dart';
import 'package:music_app/const/string.dart';
import 'package:music_app/screens/sign_up/component/api_signup.dart';

class SignUp2Screen extends StatefulWidget {
  const SignUp2Screen({super.key});

  @override
  State<SignUp2Screen> createState() => _SignUp2ScreenState();
}

class _SignUp2ScreenState extends State<SignUp2Screen> {
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  final TextEditingController controllerNickname = TextEditingController();

  final TextEditingController controllerDate = TextEditingController();
  final TextEditingController controllerGender = TextEditingController();
  String selectedValue = 'nam';

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
                BaseTextFormField(
                  controller: controllerNickname,
                  text: StringConst.textUsername,
                  width: MediaQuery.of(context).size.width * 0.95,
                  validator: (value) {
                    if (value == '') {
                      return StringConst.notiErrorUsername[0];
                    }
                    if (value.toString().length <= 6) {
                      return StringConst.notiErrorUsername[1];
                    }
                    return null;
                  },
                  textInputType: TextInputType.text,
                  isHide: false,
                ),
                const SizedBox(
                  height: Dimen.sizedBoxSmall,
                ),
                BaseTextformFieldSurfixIcon(
                  controller: controllerDate,
                  text: StringConst.textDateOfBirth,
                  function: () => selectDate(context).then(
                    (value) {
                      value ??= DateTime.now();
                      controllerDate.text =
                          DateFormat('dd/MM/yyyy').format(value);
                      setState(() {});
                    },
                  ),
                  validator: (value) {
                    if (value == '' || value == null) {
                      return StringConst.notiErrorDateOfBirth[0];
                    }
                    return null;
                  },
                  isReadOnly: true,
                  surfixIcon: const Icon(Icons.calendar_month),
                ),
                const SizedBox(
                  height: Dimen.sizedBoxSmall,
                ),
                DropdownButtonFormField<String>(
                  value: selectedValue,
                  decoration: InputDecoration(
                    hintText: StringConst.textGender,
                    fillColor: ColorConst.primaryColorTextFormField,
                    hintStyle: Component.textStyleTextFormField,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          Dimen.borderRadiusTextFormField),
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'nam', child: Text('Nam')),
                    DropdownMenuItem(value: 'nữ', child: Text('Nữ')),
                    DropdownMenuItem(value: 'khác', child: Text('Khác')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: Dimen.sizedBoxMedium * 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BaseButton(
                      text: StringConst.signup,
                      function: () async {
                        // Map<String, dynamic> dataSignUp1 =
                        //     ModalRoute.of(context)!.settings
                        //         as Map<String, dynamic>;
                        if (keyForm.currentState!.validate()) {}
                        ApiSignUp().regisAccount(

                            // dataSignUp1["firstName"],
                            // dataSignUp1["lastName"],
                            // dataSignUp1["email"],
                            // dataSignUp1["password"],
                            "ffffff",
                            "ffffff",
                            "ffffff@gmail.",
                            "ffffffff",
                            controllerNickname.text,
                            DateFormat("dd/MM/yyyy").parse("23/3/2003"),
                            controllerGender.text,
                            context);

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

  Future<DateTime?> selectDate(BuildContext context) {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
  }
}
