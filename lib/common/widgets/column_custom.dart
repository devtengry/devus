import 'package:flutter/material.dart';

class ColumnCustom extends StatelessWidget {
  const ColumnCustom({
    super.key,
    this.customMainAxisAlignment,
    this.customCrossAxisAlignment,
    required this.customColumnChildrens,
    this.spacingValue,
  });

  final MainAxisAlignment? customMainAxisAlignment;
  final CrossAxisAlignment? customCrossAxisAlignment;
  final List<Widget> customColumnChildrens;
  final double? spacingValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: spacingValue ?? 10,
      mainAxisAlignment: customMainAxisAlignment ?? MainAxisAlignment.center,
      crossAxisAlignment: customCrossAxisAlignment ?? CrossAxisAlignment.start,
      children: customColumnChildrens,
    );
  }
}
