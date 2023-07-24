import 'package:flutter/material.dart';
import 'package:music_app/base_widget/button.dart';
import 'package:music_app/const/component.dart';

class PopularMusic extends StatefulWidget {
  const PopularMusic({super.key});

  @override
  State<PopularMusic> createState() => _PopularMusicState();
}

class _PopularMusicState extends State<PopularMusic> {
  static const List<String> data = ['Song', 'Singer', 'Album'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 50,
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return BaseButton(
                          text: data[index],
                          function: () {
                            setState(() {});
                          },
                          height: 50,
                          width: 83,
                          textStyle: Component.textStyleText,
                          borderRadius: 20);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                    itemCount: data.length),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
