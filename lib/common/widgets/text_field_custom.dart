import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

typedef ValidatorFunction = String? Function(String? value);

class TextFieldCustom extends HookWidget {
  const TextFieldCustom({
    super.key,
    this.hintText,
    this.keyboardType,
    this.validator,
    this.isPassword = false,
    this.controller,
    this.textFieldColor,
  });

  final String? hintText;
  final TextInputType? keyboardType;
  final ValidatorFunction? validator;
  final bool isPassword;
  final TextEditingController? controller;
  final Color? textFieldColor;
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
        filled: true,
        fillColor: textFieldColor,
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
