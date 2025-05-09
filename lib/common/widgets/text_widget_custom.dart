import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextWidgetCustom extends StatelessWidget {
  const TextWidgetCustom({
    super.key,
    required this.customText,
    this.customFontSize,
  });
  final String customText;
  final int? customFontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      customText.tr(),
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: (customFontSize ?? 12).sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
