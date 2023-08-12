import 'package:flutter/material.dart';
import 'package:music_app/base_widget/search.dart';
import 'package:music_app/const/dimen.dart';
import 'package:music_app/screens/home/component/discover.dart';
import 'package:music_app/screens/home/component/popular_music.dart';
import 'component/appbar_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controllerSearchBar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const AppBarHome(),
      body: Column(
        children: [
          const SizedBox(
            height: Dimen.sizedBoxMedium,
          ),
          BaseSearchBar(
            controller: controllerSearchBar,
          ),
          const Discover(),
          const PopularMusic(),
          // const Spacer(),
        ],
      ),
    );
  }
}
