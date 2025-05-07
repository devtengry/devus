import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
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
