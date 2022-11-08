import 'package:flutter/material.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:presence/controller/authentication/register_page_controller.dart';
import 'package:presence/widgets/button/main_button.dart';
import 'package:presence/widgets/button/rounded_image_button.dart';
import 'package:presence/widgets/input/rounded_input.dart';
import 'package:presence/common/app_constants.dart';
import 'package:get/get.dart';
import 'package:presence/widgets/text/separator_text.dart';
import 'package:presence/widgets/text/title_group.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final pageController = Get.put(RegisterPageController());

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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Heading
                TitleGroup(title: 'greet'.tr, subTitle: 'welcome_cap'.tr),
                const SizedBox(
                  height: AppConstants.spacing * 5,
                ),
                // inputs
                Wrap(
                  runSpacing: AppConstants.spacing * 2,
                  children: [
                    RoundedInput(
                      hintText: 'email',
                      color: AppConstants.neutral_500,
                      onChanged: (val) {},
                      controller: pageController.emailController,
                    ),
                    RoundedInput(
                      hintText: 'company id',
                      suffixIcon: Ph.buildings,
                      color: AppConstants.neutral_500,
                      onChanged: (val) {},
                      controller: pageController.companyIdController,
                    ),
                    RoundedInput(
                      hintText: 'username',
                      color: AppConstants.neutral_500,
                      onChanged: (val) {},
                      controller: pageController.usernameController,
                    ),
                    RoundedInput(
                      hintText: 'password',
                      suffixIcon: Ph.eye_slash,
                      color: AppConstants.neutral_500,
                      onChanged: (val) {},
                      controller: pageController.passwordController,
                    ),
                  ],
                ),
                const SizedBox(height: AppConstants.spacing * 5),
                // Sign in Button
                MainButton(
                  title: 'sign_up'.tr,
                  type: 'primary',
                  onPressed: () => Get.toNamed('/register_company'),
                ),
                const SizedBox(
                  height: AppConstants.spacing * 5,
                ),
                Column(
                  children: [
                    SeparatorText(title: 'sign_up_with'.tr),
                    const SizedBox(height: AppConstants.spacing * 2),
                    // Social Media Login
                    Wrap(
                      alignment: WrapAlignment.center,
                      direction: Axis.horizontal,
                      spacing: AppConstants.spacing * 2,
                      children: [
                        RoundedImageButton(
                          onPressed: (val) {},
                          image: 'assets/images/google.png',
                        ),
                        RoundedImageButton(
                          onPressed: (val) {},
                          image: 'assets/images/facebook.png',
                        ),
                        RoundedImageButton(
                          onPressed: (val) {},
                          image: 'assets/images/twitter.png',
                        ),
                      ],
                    ),
                    const SizedBox(height: AppConstants.spacing * 2),
                    // Sing
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('member'.tr,
                            style: Theme.of(context).textTheme.bodySmall),
                        Text(', '.tr,
                            style: Theme.of(context).textTheme.bodySmall),
                        InkWell(
                          onTap: () => Get.offNamed('/login'),
                          child: Text(
                            'sign_in'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: AppConstants.purple_400,
                                    fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    )
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
