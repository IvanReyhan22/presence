import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:presence/controller/authentication/greeting_controller.dart';
import 'package:presence/common/app_constants.dart';
import 'package:presence/widgets/text/title_group.dart';

class Greeting extends StatelessWidget {
  Greeting({Key? key}) : super(key: key);

  final pageController = Get.put(GreetingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppConstants.spacing * 5,
            horizontal: AppConstants.spacing * 3,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.spacing * 5,
                ),
                child:
                    Image.asset('assets/images/ilustration_girl_with_dog.png'),
              ),
              const SizedBox(
                height: (AppConstants.spacing * 7) + 4,
              ),
              TitleGroup(title: 'welcome'.tr, subTitle: 'welcome_cap'.tr),
            ],
          ),
        ),
      ),
    );
  }
}
