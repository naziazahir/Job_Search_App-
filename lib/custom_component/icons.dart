import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final double iconSize;

  const CustomIcon({
    super.key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor = const Color(0xFFE5E4E2),
    this.iconSize = 30.0,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: CircleBorder(),
      ),
      child: IconButton(
        iconSize: iconSize,
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.black),
      ),
    );
  }
}
