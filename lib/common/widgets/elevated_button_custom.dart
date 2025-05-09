import 'package:flutter/material.dart';

class ElevatedButtonCustom extends StatelessWidget {
  const ElevatedButtonCustom({
    super.key,
    required this.onPressed,
    required this.customButtonText,
    required this.customButtonBackround,
  });

  final VoidCallback onPressed;
  final String customButtonText;
  final Color customButtonBackround;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,

      child: Text(customButtonText, style: TextStyle(color: Colors.white)),
    );
  }
}
