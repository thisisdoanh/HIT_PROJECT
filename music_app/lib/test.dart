import 'package:flutter/material.dart';
import 'package:music_app/const/string.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            StringConst.assetImgOnboarding1,
          ),
        ),
      ),
    );
  }
}
