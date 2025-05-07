import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.cutomTextFieldEditingController,
    this.customTextFieldKeyboardType,
  });

  final TextEditingController? cutomTextFieldEditingController;
  final TextInputType? customTextFieldKeyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: cutomTextFieldEditingController,
      keyboardType: customTextFieldKeyboardType,
    );
  }
}
