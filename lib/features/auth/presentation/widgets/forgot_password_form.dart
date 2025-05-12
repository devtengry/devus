import 'package:devus/common/widgets/column_custom.dart';
import 'package:devus/common/widgets/text_field_custom.dart';
import 'package:devus/common/widgets/text_widget_custom.dart';
import 'package:flutter/material.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({
    super.key,
    required this.formKey,
    required this.emailController,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: ColumnCustom(
        customColumnChildrens: [
          TextWidgetCustom(customText: 'email'),
          TextFieldCustom(
            controller: emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Lütfen email giriniz';
              }
              if (!value.contains('@')) {
                return 'Geçerli bir email giriniz';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
