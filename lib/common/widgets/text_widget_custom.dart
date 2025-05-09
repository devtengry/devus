import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextWidgetCustom extends StatelessWidget {
  const TextWidgetCustom({super.key, required this.customText});
  final String customText;
  @override
  Widget build(BuildContext context) {
    return Text(
      customText,
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: 10.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
