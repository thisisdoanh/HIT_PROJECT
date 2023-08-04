import 'package:flutter/material.dart';
import 'package:music_app/base_widget/image.dart';
import 'package:music_app/const/component.dart';

class Discover extends StatelessWidget {
  const Discover({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 32,
        ),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              'Discover',
              style: Component.textStyleHomeTitle,
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        InkWell(
          child: Stack(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  BaseImage(
                    height: 122,
                    width: MediaQuery.of(context).size.width - 40,
                    assetImage: 'assets/images/img_home_discover.png',
                    borderRadius: 20,
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 31,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 45,
                      ),
                      Container(
                        height: 60,
                        width: 170,
                        child: const Text(
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
