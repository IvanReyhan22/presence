import 'package:circular_countdown/circular_countdown.dart';
import 'package:flutter/material.dart';
import 'package:presence/button/main_button.dart';
import 'package:presence/button/rounded_image_button.dart';
import 'package:presence/service/global_data.dart';
import 'package:presence/text/paragraph.dart';

class MyModalBottomSheet {
  static void reminderModal(context) {
    Size size = MediaQuery.of(context).size;
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(GlobalData.defaultRadius),
          topRight: Radius.circular(GlobalData.defaultRadius),
        ),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(GlobalData.spacing * 3),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RoundedImageButton(
                onPressed: (val) {},
                image: 'assets/icons/clock.png',
                bgColor: GlobalData.purple_200,
                color: GlobalData.neutral_900,
              ),
              const SizedBox(height: GlobalData.spacing * 3),
              const Paragraph(
                title: 'Heads Up, 15 minutes before late',
                size: 2,
                color: GlobalData.neutral_900,
                weight: FontWeight.w600,
              ),
              const SizedBox(height: GlobalData.spacing / 2),
              const Paragraph(
                title: 'Wakey wakeyyy, your about to be late get going now.',
                size: 3,
                color: GlobalData.neutral_500,
              ),
              const SizedBox(height: GlobalData.spacing * 3),
              TimeCircularCountdown(
                strokeWidth: GlobalData.spacing * 2,
                diameter: size.width * 0.5,
                countdownCurrentColor: GlobalData.purple_400,
                countdownRemainingColor: GlobalData.purple_200,
                unit: CountdownUnit.minute,
                gapFactor: GlobalData.spacing,
                countdownTotal: 15,
                textStyle: const TextStyle(
                  color: GlobalData.purple_400,
                  fontWeight: FontWeight.w600,
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: GlobalData.spacing * 3),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: MainButton(
                      title: 'Permit',
                      type: 'secondary',
                      onPressed: (int val) {},
                    ),
                  ),
                  const SizedBox(width: (GlobalData.spacing * 2) + 4),
                  Expanded(
                    child: MainButton(
                      title: 'Scan Qr Code',
                      type: 'primary',
                      onPressed: (int val) {},
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
