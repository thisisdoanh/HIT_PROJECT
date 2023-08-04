import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BaseIcon extends StatefulWidget {
  const BaseIcon({
    super.key,
    required this.assetName,
    required this.height,
    required this.width,
    required this.function,
  });

  final String assetName;
  final double height;
  final double width;
  final Function function;

  @override
  State<BaseIcon> createState() => _BaseIconState();
}

class _BaseIconState extends State<BaseIcon>
    with SingleTickerProviderStateMixin {
  bool isTap = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: SvgPicture.asset(
        widget.assetName,
        fit: BoxFit.cover,
        height: widget.height,
        width: widget.width,
      ),
      onPressed: () {
        widget.function();
      },
    );
  }
}
