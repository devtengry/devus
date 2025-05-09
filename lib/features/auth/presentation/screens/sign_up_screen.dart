import 'package:devus/common/hooks/validator_hooks.dart';
import 'package:devus/common/widgets/column_custom.dart';
import 'package:devus/common/widgets/elevated_button_custom.dart';
import 'package:devus/common/widgets/text_button_custom.dart';
import 'package:devus/common/widgets/text_field_custom.dart';
import 'package:devus/common/widgets/text_widget_custom.dart';
import 'package:devus/features/auth/data/firebase_authentication.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final TextEditingController _emailController = TextEditingController();
    // ignore: no_leading_underscores_for_local_identifiers
    final TextEditingController _passwordController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: ColumnCustom(
                customCrossAxisAlignment: CrossAxisAlignment.center,
                customColumnChildrens: [
                  TextWidgetCustom(customText: 'create_account'),
                ],
              ),
            ),

            Expanded(
              flex: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: SingleChildScrollView(
                    child: Form(
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
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: ElevatedButtonCustom(
          customButtonBackround: Colors.blueGrey,
          customButtonText: 'sign_up'.tr(),
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              await FirebaseAuthentication().createUserWithEmailAndPassword(
                context: context,
                email: _emailController.text,
                password: _passwordController.text,
              );
            }
          },
        ),
      ),
    );
  }
}
