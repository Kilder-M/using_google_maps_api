import 'package:flutter/material.dart';

class MapBackButton extends StatelessWidget {
  final double? width, height;
  final Color? backgroundColor, iconColor;
  final void Function()? onTap;
  const MapBackButton(
      {super.key,
      this.width,
      this.height,
      this.backgroundColor,
      this.iconColor,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 40,
        width: width ?? 40,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            Icons.chevron_left_rounded,
            size: 32,
            color: iconColor ?? Colors.black,
          ),
        ),
      ),
    );
  }
}
