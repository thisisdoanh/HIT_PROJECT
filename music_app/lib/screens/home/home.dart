import 'package:flutter/material.dart';

import 'component/appbar_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
      appBar: AppBarHome(),
      body: Column(
        children: [],
      ),

    );
  }
}
