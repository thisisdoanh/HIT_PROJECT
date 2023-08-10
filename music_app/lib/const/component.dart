import 'package:flutter/material.dart';
import 'package:music_app/const/color.dart';
import 'package:music_app/const/dimen.dart';

class Component {
  static const TextStyle textStyleButtonLarge = TextStyle(
    color: ColorConst.colorTextButton,
    fontFamily: 'poppins',
    fontSize: Dimen.fontSizeButtonLarge,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle textStyleTittle = TextStyle(
    color: ColorConst.colorTextButton,
    fontFamily: 'poppins',
    fontSize: Dimen.fontSizeTittle,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle textStyleTextFormField = TextStyle(
    color: ColorConst.colorText,
    fontSize: Dimen.fontSizeLabelTextFormField,
    fontFamily: 'inter',
    fontWeight: FontWeight.w100,
  );

  static const TextStyle textStyleTextTittle = TextStyle(
    color: ColorConst.colorText,
    fontFamily: 'inter',
    fontWeight: FontWeight.w700,
    fontSize: Dimen.fontSizeTextTittle,
  );
  
  static const TextStyle albumTitle = TextStyle(
    color: ColorConst.colorText,
    fontFamily: 'inter',
    fontWeight: FontWeight.w700,
    fontSize: 24,
  );
  static const TextStyle textStyleHomeTitle = TextStyle(
    color: ColorConst.colorText,
    fontFamily: 'inter',
    fontWeight: FontWeight.w100,
    fontSize: Dimen.fontSizeTextTittle,
  );

  static const TextStyle textStyleMusicName = TextStyle(
    color: ColorConst.colorText,
    fontFamily: 'inter',
    fontWeight: FontWeight.w900,
    fontSize: Dimen.fontSizeTextTittle + 5,
  );

  static const TextStyle textStyleAppName = TextStyle(
    color: ColorConst.colorText,
    fontFamily: 'monserrat',
    fontSize: 28,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle textStyleText = TextStyle(
    color: ColorConst.colorText,
    fontFamily: 'inter',
    fontSize: 14,
  );
  static const TextStyle textStyleTextButtonSmall = TextStyle(
    color: ColorConst.colorText,
    fontFamily: 'inter',
    fontSize: 18,
  );
  static ButtonStyle buttonPlaySkipPrevious = ElevatedButton.styleFrom(
    backgroundColor: ColorConst.colorButton,
    padding: const EdgeInsets.all(0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );
  static const TextStyle singerName = TextStyle(
    color: ColorConst.colorTextButton,
    fontFamily: 'inter',
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  PageRouteBuilder<dynamic> navigate(Widget screen, [arguments]) {
    return PageRouteBuilder(
      settings: RouteSettings(arguments: arguments),
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionDuration: const Duration(milliseconds: 700),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
