import 'package:flutter/material.dart';

class IconButtonRounded extends StatelessWidget {
  final Widget icon;
  final Color backgroundColor;
  final VoidCallback onPress;
  final BorderRadius borderRadius;
  final double size;

  IconButtonRounded({
    Key? key,
    required this.icon,
    required this.backgroundColor,
    required this.onPress,
    required this.size,
    this.borderRadius = BorderRadius.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: size,
        width: size,
        decoration:
            BoxDecoration(borderRadius: borderRadius, color: backgroundColor),
        child: Center(
            child: icon),
      ),
    );
  }
}
