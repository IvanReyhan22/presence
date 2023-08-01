import 'package:circular_countdown/circular_countdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presence/widgets/button/main_button.dart';
import 'package:presence/widgets/card/time_card.dart';
import 'package:presence/common/custom_icons_icons.dart';
import 'package:presence/common/app_constants.dart';
import 'package:presence/widgets/text/title_group.dart';

class CheckInPage extends StatelessWidget {
  const CheckInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppConstants.spacing * 5,
              horizontal: AppConstants.spacing * 3,
            ),
            child: Column(children: <Widget>[
              // Head
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: AppConstants.spacing * 4),
                  Text(
                    'Check In Alert',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: AppConstants.neutral_500,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      size: AppConstants.spacing * 4,
                      color: AppConstants.neutral_900,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppConstants.spacing * 3),
              Text(
                '11:45 AM',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppConstants.secondary_400,
                      fontWeight: FontWeight.w600,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppConstants.spacing * 3),
              const TitleGroup(
                  title: 'Wakey Wakeyy!!',
                  subTitle:
                      'Hy!! attention you have 15 minutes left before late!!'),
              const SizedBox(height: AppConstants.spacing * 3),
              TimeCircularCountdown(
                strokeWidth: AppConstants.spacing * 2,
                diameter: size.width * 0.6,
                countdownCurrentColor: AppConstants.purple_400,
                countdownRemainingColor: AppConstants.purple_200,
                unit: CountdownUnit.minute,
                gapFactor: AppConstants.spacing,
                countdownTotal: 15,
                textStyle: const TextStyle(
                  color: AppConstants.purple_400,
                  fontWeight: FontWeight.w600,
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: AppConstants.spacing * 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Expanded(
                    child: TimeCard(
                      icon: CustomIcons.schedule,
                      title: '15 January 2022',
                      type: 'date',
                    ),
                  ),
                  SizedBox(width: (AppConstants.spacing * 2) + 4),
                  Expanded(
                    child: TimeCard(
                      icon: CustomIcons.clock,
                      title: 'Night Shift, 12 : 00 AM',
                      type: 'schedule',
                    ),
                  )
                ],
              ),
              const SizedBox(height: AppConstants.spacing * 3),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: MainButton(
                      title: 'Permit',
                      type: 'secondary',
                      onPressed: () => Get.toNamed('/permit_page'),
                      isLoading: false,
                    ),
                  ),
                  const SizedBox(width: (AppConstants.spacing * 2) + 4),
                  Expanded(
                    child: MainButton(
                      title: 'Scan Qr Code',
                      type: 'primary',
                      onPressed: () => Get.toNamed('/scan_qr'),
                      isLoading: false,
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
