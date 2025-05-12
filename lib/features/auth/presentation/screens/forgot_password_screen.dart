import 'package:devus/common/constants/sizes.dart';
import 'package:devus/common/widgets/column_custom.dart';
import 'package:devus/common/widgets/elevated_button_custom.dart';
import 'package:devus/common/widgets/text_widget_custom.dart';
import 'package:devus/features/auth/data/firebase_authentication.dart';
import 'package:devus/features/auth/presentation/widgets/auth_container_widget.dart';
import 'package:devus/features/auth/presentation/widgets/forgot_password_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final TextEditingController _emailController = TextEditingController();
    // ignore: no_leading_underscores_for_local_identifiers
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: ColumnCustom(
                customColumnChildrens: [
                  TextWidgetCustom(
                    customText: 'enter_mail',
                    customFontSize:
                        Theme.of(
                          context,
                        ).textTheme.titleLarge?.fontSize?.toInt(),
                  ),
                ],
              ),
            ),

            Expanded(
              child: AuthContainerCustom(
                containerChild: Padding(
                  padding: EdgeInsets.all(ScreenSize.kPaddingLarge),
                  child: SingleChildScrollView(
                    child: ColumnCustom(
                      customColumnChildrens: [
                        ForgotPasswordForm(
                          formKey: formKey,
                          emailController: _emailController,
                        ),
                        TextWidgetCustom(
                          customText: 'within_minute',
                          customFontSize:
                              Theme.of(
                                context,
                              ).textTheme.labelSmall?.fontSize?.toInt(),
                        ),
                      ],
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
          onPressed: () {
            final email = _emailController.text.trim();
            FirebaseAuthentication().firebaseResetPassword(email);
          },
          customButtonText: 'send_mail'.tr(),
          customButtonBackround: Colors.blueGrey,
        ),
      ),
    );
  }
}
// immogluomer@gmail.com