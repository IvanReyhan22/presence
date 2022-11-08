import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:presence/controller/authentication/register_company_controller.dart';
import 'package:presence/widgets/button/main_button.dart';
import 'package:presence/widgets/input/rounded_input.dart';
import 'package:presence/common/app_constants.dart';
import 'package:presence/widgets/text/title_group.dart';

class RegisterCompany extends StatelessWidget {
  RegisterCompany({Key? key}) : super(key: key);

  final pageController = Get.put(RegisterCompanyController());

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
                  child: Image.asset(
                      'assets/images/ilustration_man_chatting_with_computer.png'),
                ),
                const SizedBox(height: AppConstants.spacing * 7),
                TitleGroup(
                  title: 'company_register'.tr,
                  subTitle: 'company_register_caption'.tr,
                ),
                const SizedBox(height: AppConstants.spacing * 7),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RoundedInput(
                      hintText: 'company_id'.tr,
                      color: AppConstants.neutral_500,
                      onChanged: (val) {},
                      controller: pageController.companyIdController,
                      suffixIcon: Ph.buildings,
                    ),
                    const SizedBox(
                      height: AppConstants.spacing * 5,
                    ),
                    MainButton(
                      title: 'sign_up'.tr,
                      type: 'primary',
                      onPressed: () => Get.toNamed('/greeting'),
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
