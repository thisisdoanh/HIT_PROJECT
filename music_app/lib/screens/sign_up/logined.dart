import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_app/base_widget/image.dart';
import 'package:music_app/controller.dart';
import 'package:music_app/screens/sign_in/component/google_sign_in_provider.dart';

class Logined extends StatelessWidget {
  const Logined({super.key});

  @override
  Widget build(BuildContext context) {
    AudioManager().reset();
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: Column(
        children: [
          BaseImageNetwork(
            height: 50,
            width: 50,
            linkImage: user?.photoURL ??
                "https://res.cloudinary.com/dzlxu2dlv/image/upload/v1690136815/Music-Player-App/Default/g9e3aeu3mrnn5l1hu6qh.jpg",
            borderRadius: 30,
          ),
          Text(user?.displayName ?? "Error"),
          Text(user?.email ?? "Error"),
          Text(GoogleSignInProvider.accessToken),
          // Text("data"),
        ],
      ),
    );
  }
}
