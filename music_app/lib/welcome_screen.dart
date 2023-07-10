import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Back"),
          ),
        ],
      ),
    );
  }
}
