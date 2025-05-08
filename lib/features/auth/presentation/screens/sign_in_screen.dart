import 'package:devus/common/hooks/validator_hooks.dart';
import 'package:devus/common/widgets/custom_column.dart';
import 'package:devus/common/widgets/custom_elevated_button.dart';
import 'package:devus/common/widgets/custom_text_button.dart';
import 'package:devus/common/widgets/custom_text_filed.dart';
import 'package:devus/common/widgets/custom_text_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = 1.sh;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: screenHeight * 0.5.h,
              child: CustomColumn(
                customCrossAxisAlignment: CrossAxisAlignment.center,
                customColumnChildrens: [
                  Text(
                    'create_account'.tr(),
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              top: screenHeight * 0.4.h,
              left: 0,
              right: 0,
              bottom: 0,
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
                    child: CustomColumn(
                      customColumnChildrens: [
                        CustomTextWidget(customText: 'name'.tr()),
                        CustomTextField(validator: nameValidator),
                        CustomTextWidget(customText: 'email'.tr()),
                        CustomTextField(validator: emailValidator),
                        CustomTextWidget(customText: 'password'.tr()),
                        CustomTextField(
                          isPassword: true,
                          validator: passwordValidator,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomTextButton(
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
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: CustomElevatedButton(
          customButtonBackround: Colors.blueGrey,
          customButtonText: 'sign_in'.tr(),
          onPressed: () => context.go('/'),
        ),
      ),
    );
  }
}
