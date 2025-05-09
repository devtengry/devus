import 'package:devus/common/hooks/validator_hooks.dart';
import 'package:devus/common/widgets/column_custom.dart';
import 'package:devus/common/widgets/text_button_custom.dart';
import 'package:devus/common/widgets/text_field_custom.dart';
import 'package:devus/common/widgets/text_widget_custom.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
    required this.formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) : _emailController = emailController,
       _passwordController = passwordController;

  final GlobalKey<FormState> formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ColumnCustom(
        customColumnChildrens: [
          TextWidgetCustom(customText: 'email'.tr()),
          TextFieldCustom(
            validator: emailValidator,
            controller: _emailController,
          ),
          TextWidgetCustom(customText: 'password'.tr()),
          TextFieldCustom(
            isPassword: true,
            validator: passwordValidator,
            controller: _passwordController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButtonCustom(
                customTextButtonText: 'login',
                onPressed: () => context.go('/'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
