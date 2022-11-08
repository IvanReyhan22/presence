import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:presence/controller/authentication/forgot_password_controller.dart';
import 'package:presence/widgets/button/main_button.dart';
import 'package:presence/widgets/input/rounded_input.dart';
import 'package:presence/common/app_constants.dart';
import 'package:presence/widgets/text/title_group.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);

  final pageController = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppConstants.spacing * 5,
              horizontal: AppConstants.spacing * 3,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.spacing * 5,
                  ),
                  child:
                      Image.asset('assets/images/ilustration_lock_large.png'),
                ),
                const SizedBox(height: AppConstants.spacing * 7),
                TitleGroup(
                  title: 'forgot_password'.tr,
                  subTitle: 'forgot_password_caption'.tr,
                ),
                const SizedBox(height: AppConstants.spacing * 7),
                Column(
                  children: [
                    RoundedInput(
                      hintText: 'email'.tr,
                      color: AppConstants.neutral_500,
                      onChanged: (val) {},
                      controller: pageController.emailController,
                    ),
                    const SizedBox(
                      height: AppConstants.spacing * 5,
                    ),
                    MainButton(
                      title: 'reset'.tr,
                      type: 'primary',
                      onPressed: (int val) => Get.toNamed('/login'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
