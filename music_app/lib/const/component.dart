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

  static const TextStyle textStyleAppName = TextStyle(
    color: ColorConst.colorText,
    fontFamily: 'monserrat',
    fontSize: 28,
    fontWeight: FontWeight.w900,
    
  );

  static const TextStyle textStyleText = TextStyle(
    color: ColorConst.colorText,
    fontFamily: 'inter',
    fontSize: 20,
   
  );

  PageRouteBuilder<dynamic> navigate(Widget screen) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionDuration: const Duration(milliseconds: 500),
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
