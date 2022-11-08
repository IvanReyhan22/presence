import 'package:flutter/material.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:presence/controller/authentication/login_page_controller.dart';
import 'package:presence/widgets/button/main_button.dart';
import 'package:presence/widgets/button/rounded_image_button.dart';
import 'package:presence/widgets/input/rounded_input.dart';
import 'package:presence/common/app_constants.dart';
import 'package:get/get.dart';
import 'package:presence/widgets/text/separator_text.dart';
import 'package:presence/widgets/text/title_group.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final pageController = Get.put(LoginPageController());

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
                TitleGroup(title: 'hello'.tr, subTitle: 'welcome_cap'.tr),
                const SizedBox(height: (AppConstants.spacing * 7) + 4),
                // inputs
                Wrap(
                  runSpacing: AppConstants.spacing * 2,
                  children: [
                    RoundedInput(
                      hintText: 'username',
                      color: AppConstants.neutral_500,
                      onChanged: (val) {},
                      controller: pageController.usernameController,
                    ),
                    RoundedInput(
                      hintText: 'Password',
                      type: 'password',
                      suffixIcon: Ph.eye,
                      color: AppConstants.neutral_500,
                      onChanged: (val) {},
                      controller: pageController.passwordController,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: InkWell(
                        onTap: () => Get.toNamed('/forgot_password'),
                        child: Text(
                          'forgot_password'.tr,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: AppConstants.neutral_500,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: AppConstants.spacing * 5),
                MainButton(
                  title: 'sign_in'.tr,
                  type: 'primary',
                  onPressed: () => Get.toNamed('/greeting'),
                ),
                const SizedBox(height: (AppConstants.spacing * 7) + 4),
                Column(
                  children: [
                    SeparatorText(title: 'sign_in_with'.tr),
                    const SizedBox(height: AppConstants.spacing * 5),
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
                    const SizedBox(height: AppConstants.spacing * 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('guess'.tr,
                            style: Theme.of(context).textTheme.bodySmall),
                        Text(', '.tr,
                            style: Theme.of(context).textTheme.bodySmall),
                        InkWell(
                          onTap: () => Get.offNamed('/register'),
                          child: Text(
                            'sign_up'.tr,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: AppConstants.purple_400,
                                      fontWeight: FontWeight.w600,
                                    ),
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
