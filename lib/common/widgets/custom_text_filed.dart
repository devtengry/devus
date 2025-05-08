import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

typedef ValidatorFunction = String? Function(String? value);

class CustomTextField extends HookWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.keyboardType,
    this.validator,
    this.isPassword = false,
    this.controller,
  });

  final String? hintText;
  final TextInputType? keyboardType;
  final ValidatorFunction? validator;
  final bool isPassword;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final isObscured = useState(isPassword);

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isObscured.value,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon:
            isPassword
                ? IconButton(
                  icon: Icon(
                    isObscured.value ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () => isObscured.value = !isObscured.value,
                )
                : null,
      ),
    );
  }
}
