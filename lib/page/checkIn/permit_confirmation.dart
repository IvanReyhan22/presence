import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presence/widgets/button/main_button.dart';
import 'package:presence/common/app_constants.dart';
import 'package:presence/widgets/text/title_group.dart';

class PermitConfirmation extends StatelessWidget {
  const PermitConfirmation({Key? key}) : super(key: key);

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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.spacing * 5,
                ),
                child: Image.asset(
                    'assets/images/ilustration_girl_with_computer_and_paper.png'),
              ),
              const SizedBox(
                height: (AppConstants.spacing * 7) + 4,
              ),
              const TitleGroup(
                title: 'Permit Recorded',
                subTitle:
                    'You’r permit have been recorded and will be reviewed by the company administration.',
              ),
              const SizedBox(
                height: AppConstants.spacing * 4,
              ),
              MainButton(
                title: 'Done',
                type: 'primary',
                onPressed: () => Get.offAllNamed('/main_app'),
                isLoading: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
