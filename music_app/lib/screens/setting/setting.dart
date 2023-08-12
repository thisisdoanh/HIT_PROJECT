import 'package:flutter/cupertino.dart';
import 'package:music_app/base_widget/button.dart';
import 'package:music_app/base_widget/image.dart';
import 'package:music_app/const/color.dart';
import 'package:music_app/const/dimen.dart';
import 'package:music_app/data_api/data_api.dart';

import '../../const/component.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(width: 4, color: ColorConst.colorText),
              borderRadius: BorderRadius.circular(Dimen.borderRadiusImage + 4)),
          child: BaseImageNetwork(
            height: Dimen.sizeImageUser * 0.8,
            width: Dimen.sizeImageUser * 0.8,
            linkImage: DataApi.user!.avatar,
            borderRadius: Dimen.borderRadiusImage - 4,
          ),
        ),
        SizedBox(
          height: Dimen.sizedBoxMedium,
        ),
        Text(
          "${DataApi.user!.firstName} ${DataApi.user!.lastName}",
          style: Component.textStyleTextTittle,
        ),
        SizedBox(
          height: Dimen.sizedBoxSmall,
        ),
        Text(
          "${DataApi.user!.email}",
          style: Component.textStyleText,
        ),
        const SizedBox(
          height: Dimen.sizedBoxSmall,
        ),
        BaseButton(
            text: StringConst,
            function: function,
            height: height,
            width: width,
            textStyle: textStyle,
            borderRadius: borderRadius)
      ],
    );
  }
}
