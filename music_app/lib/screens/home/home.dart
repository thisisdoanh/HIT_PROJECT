import 'package:flutter/material.dart';
import 'package:music_app/screens/home/component/discover.dart';
import 'package:music_app/screens/home/component/popular_music.dart';
import 'package:music_app/test.dart';

import 'component/appbar_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    
    return const Scaffold(

      appBar: AppBarHome(),
      body: Column(
        children: [
          Discover(),
          PopularMusic(),
          Spacer(),
          
        ],
      ),
    );
  }
}
