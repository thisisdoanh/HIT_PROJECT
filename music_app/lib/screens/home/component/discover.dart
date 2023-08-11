import 'package:flutter/material.dart';
import 'package:music_app/base_widget/image.dart';
import 'package:music_app/const/component.dart';

class Discover extends StatelessWidget {
  const Discover({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Text(
              'Discover',
              style: Component.textStyleHomeTitle,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
          child: Stack(
            children: [
              // cu
              // Row(
              //   children: [
              //     const SizedBox(
              //       width: 20,
              //     ),
              //     BaseImage(
              //       height: 122,
              //       width: MediaQuery.of(context).size.width - 40,
              //       assetImage: 'assets/images/img_home_discover.png',
              //       borderRadius: 20,
              //     ),
              //   ],
              // ),
              // moi
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: BaseImage(
                  height: 122,
                  width: double.infinity,
                  assetImage: 'assets/images/img_home_discover.png',
                  borderRadius: 20,
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 31,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 45,
                      ),
                      SizedBox(
                        height: 60,
                        width: 170,
                        child: Text(
                          'Find The Music You want',
                          style: Component.textStyleHomeTitle,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
