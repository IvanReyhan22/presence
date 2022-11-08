import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:presence/common/custom_icons_icons.dart';
import 'package:presence/common/app_constants.dart';
import 'package:presence/controller/main_app_controller.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<MainAppController>(
      init: MainAppController(),
      builder: (controller) => Scaffold(
        body: controller.pages[controller.currentPageIndex.value],
        bottomNavigationBar: Container(
          color: AppConstants.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppConstants.spacing * 2,
              horizontal: AppConstants.spacing * 3,
            ),
            child: GNav(
              backgroundColor: AppConstants.white,
              color: AppConstants.neutral_900,
              activeColor: AppConstants.white,
              tabBackgroundColor: AppConstants.purple_400,
              padding: const EdgeInsets.symmetric(
                  vertical: AppConstants.spacing + 4,
                  horizontal: AppConstants.spacing + 4),
              gap: AppConstants.spacing,
              tabs: [
                GButton(
                  icon: CustomIcons.home,
                  text: 'home'.tr,
                ),
                GButton(
                  icon: CustomIcons.search,
                  text: 'record'.tr,
                ),
                GButton(
                  icon: CustomIcons.notification,
                  text: 'notification'.tr,
                ),
                GButton(
                  icon: CustomIcons.profile,
                  text: 'profile'.tr,
                ),
              ],
              onTabChange: (index) => controller.setPageIndex(index),
            ),
          ),
        ),
      ),
    );
  }
}
