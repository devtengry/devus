import 'package:devus/common/constants/sizes.dart';
import 'package:devus/common/widgets/column_custom.dart';
import 'package:devus/common/widgets/elevated_button_custom.dart';
import 'package:devus/common/widgets/text_widget_custom.dart';
import 'package:devus/features/auth/data/firebase_authentication.dart';
import 'package:devus/features/auth/presentation/widgets/auth_container_widget.dart';
import 'package:devus/features/auth/presentation/widgets/sign_in_form_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: ColumnCustom(
                customColumnChildrens: [
                  TextWidgetCustom(
                    customText: 'create_account',
                    customFontSize:
                        Theme.of(
                          context,
                        ).textTheme.titleLarge?.fontSize?.toInt(),
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 4,
              child: AuthContainerCustom(
                containerChild: Padding(
                  padding: EdgeInsets.all(ScreenSize.kPaddingLarge),
                  child: SingleChildScrollView(
                    child: SignInForm(
                      formKey: formKey,
                      emailController: _emailController,
                      passwordController: _passwordController,
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
              await FirebaseAuthentication().firebaseSignUp(
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
