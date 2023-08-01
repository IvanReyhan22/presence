import 'package:flutter/material.dart';
import 'package:presence/controller/authentication/onboarding_page_controller.dart';
import 'package:presence/widgets/button/main_button.dart';
import 'package:presence/common/app_constants.dart';
import 'package:get/get.dart';
import 'package:presence/widgets/text/title_group.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding({Key? key}) : super(key: key);

  final pageController = Get.put(OnBoardingPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.background,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppConstants.spacing * 5,
              horizontal: AppConstants.spacing * 3,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.spacing * 5),
                  child: Image.asset(
                      'assets/images/ilustration_girl_with_media.png'),
                ),
                TitleGroup(
                  title: 'onboard_greet'.tr,
                  subTitle: 'onboard_caption'.tr,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: MainButton(
                        title: 'sign_up'.tr,
                        type: 'secondary',
                        onPressed: () => Get.toNamed('/register'),
                        isLoading: false,
                      ),
                    ),
                    const SizedBox(width: (AppConstants.spacing * 2) + 4),
                    Expanded(
                      child: MainButton(
                        title: 'sign_in'.tr,
                        type: 'primary',
                        onPressed: () => Get.toNamed('/login'),
                        isLoading: false,
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
