import 'package:flutter/material.dart';

import 'package:music_app/const/color.dart';
import 'package:music_app/const/dimen.dart';

class BaseButton extends StatefulWidget {
  const BaseButton(
      {super.key,
      required this.text,
      required this.function,
      required this.height,
      required this.width,
      required this.textStyle,
      required this.borderRadius});

  final String text;
  final Function function;
  final double height;
  final double width;
  final TextStyle textStyle;
  final double borderRadius;

  @override
  State<BaseButton> createState() => _BaseButtonState();
}

class _BaseButtonState extends State<BaseButton> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _animation =
        Tween<double>(begin: 1, end: 1.5).animate(_animationController);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _animationController.forward(),
      onTapUp: (details) => _animationController.reverse(),
      onTapCancel: () => _animationController.reverse(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 900),
        transform:
            Matrix4.diagonal3Values(_animation.value, _animation.value, 1),
        child: ElevatedButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(Dimen.padding0),
            backgroundColor: ColorConst.colorButton,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
          ),
          onPressed: () {
            widget.function();
          },
          child: Container(
            alignment: Alignment.center,
            height: widget.height,
            width: widget.width,
            child: Text(
              widget.text,
              style: widget.textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
