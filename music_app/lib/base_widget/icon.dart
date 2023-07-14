import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BaseIcon extends StatefulWidget {
  const BaseIcon({
    super.key,
    required this.assetName,
    required this.height,
    required this.width,
  });

  final String assetName;
  final double height;
  final double width;

  @override
  State<BaseIcon> createState() => _BaseIconState();
}

class _BaseIconState extends State<BaseIcon> with SingleTickerProviderStateMixin {
  bool isTap = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          isTap = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          isTap = false;
        });
      },
      onTapCancel: () {
        setState(() {
          isTap = false;
        });
      },
      child: AnimatedPositioned(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
      top: isTap ? -10.0 : 0.0,
      child: SvgPicture.asset(
        widget.assetName,
        fit: BoxFit.cover,
        height: widget.height,
        width: widget.width,
      ),
        ),
    );
  }
}
