import 'package:devus/common/widgets/custom_column.dart';
import 'package:devus/common/widgets/custom_elevated_button.dart';
import 'package:devus/common/widgets/custom_text_filed.dart';
import 'package:devus/common/widgets/custom_text_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: screenHeight * 1,
              child: Container(color: const Color.fromARGB(255, 216, 220, 221)),
            ),

            Positioned(
              top: screenHeight * 0.5,
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
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: CustomColumn(
                      customColumnChildrens: [
                        CustomTextWidget(customText: 'name'.tr()),
                        CustomTextField(),
                        CustomTextWidget(customText: 'email'.tr()),
                        CustomTextField(),
                        CustomTextWidget(customText: 'password'.tr()),
                        CustomTextField(),
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
