import 'package:flutter/material.dart';

class AuthContainerCustom extends StatelessWidget {
  const AuthContainerCustom({
    super.key,
    this.containerBorderRadius,
    this.containerColor,
    this.containerChild,
  });

  final double? containerBorderRadius;
  final Color? containerColor;
  final Widget? containerChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: containerColor ?? Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular((containerBorderRadius ?? 20)),
          topRight: Radius.circular((containerBorderRadius ?? 20)),
        ),
      ),
      child: containerChild,
    );
  }
}
