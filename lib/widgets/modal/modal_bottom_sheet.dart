import 'package:circular_countdown/circular_countdown.dart';
import 'package:flutter/material.dart';
import 'package:presence/common/custom_icons_icons.dart';
import 'package:presence/widgets/button/main_button.dart';
import 'package:presence/common/app_constants.dart';

class MyModalBottomSheet {
  static void reminderModal(context) {
    Size size = MediaQuery.of(context).size;
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppConstants.defaultRadius),
          topRight: Radius.circular(AppConstants.defaultRadius),
        ),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(AppConstants.spacing * 3),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                color: AppConstants.purple_200,
                child: const Icon(
                  CustomIcons.clock,
                  size: AppConstants.spacing * 3,
                ),
              ),
              // RoundedImageButton(
              //   onPressed: (val) {},
              //   image: 'assets/icons/clock.svg',
              //   bgColor: AppConstants.purple_200,
              //   color: AppConstants.neutral_900,
              // ),
              const SizedBox(height: AppConstants.spacing * 3),
              Text(
                'Heads Up, 15 minutes before late',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppConstants.neutral_900,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: AppConstants.spacing / 2),
              Text(
                'Wakey wakeyyy, your about to be late get going now.',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppConstants.neutral_500,
                    ),
              ),
              const SizedBox(height: AppConstants.spacing * 3),
              TimeCircularCountdown(
                strokeWidth: AppConstants.spacing * 2,
                diameter: size.width * 0.5,
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
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: MainButton(
                      title: 'Permit',
                      type: 'secondary',
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: (AppConstants.spacing * 2) + 4),
                  Expanded(
                    child: MainButton(
                      title: 'Scan Qr Code',
                      type: 'primary',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
