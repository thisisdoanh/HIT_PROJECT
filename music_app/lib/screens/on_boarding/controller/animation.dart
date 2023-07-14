import 'package:flutter/material.dart';
import 'package:music_app/base_widget/image.dart';
import 'package:music_app/const/dimen.dart';

class AnimationOnboarding extends StatefulWidget {
  const AnimationOnboarding({
    Key? key,
    required this.assetImage,
  }) : super(key: key);

  final String assetImage;

  @override
  // ignore: library_private_types_in_public_api
  _AnimationOnboardingState createState() => _AnimationOnboardingState();
}

class _AnimationOnboardingState extends State<AnimationOnboarding>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: _animation.value * MediaQuery.of(context).size.width / 2 -
              Offset(MediaQuery.of(context).size.width * 0.5, 0) +
              Offset(MediaQuery.of(context).size.width / 2, 0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                BaseImage(
                  height: MediaQuery.of(context).size.width ,
                  width: MediaQuery.of(context).size.width *0.9 ,
                  assetImage: widget.assetImage,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
