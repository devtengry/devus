import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TextButtonCustom extends StatelessWidget {
  const TextButtonCustom({
    super.key,
    required this.onPressed,
    required this.customTextButtonText,
  });

  final VoidCallback onPressed;
  final String customTextButtonText;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(customTextButtonText.tr()),
    );
  }
}
