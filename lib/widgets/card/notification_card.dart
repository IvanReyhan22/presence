import 'package:flutter/material.dart';
import 'package:presence/widgets/button/rounded_image_button.dart';
import 'package:presence/common/custom_icons_icons.dart';
import 'package:presence/common/app_constants.dart';

import '../modal/modal_bottom_sheet.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => MyModalBottomSheet.reminderModal(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RoundedImageButton(
            onPressed: (val) {},
            icon: CustomIcons.setting,
            bgColor: AppConstants.purple_200,
            color: AppConstants.neutral_900,
          ),
          const SizedBox(
            width: AppConstants.spacing * 2,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Heads Up, 15 minutes left',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: AppConstants.neutral_900,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: AppConstants.spacing / 2),
                Text(
                  'Wakey wakeyyy, your about to be late get going now.',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppConstants.neutral_500,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: AppConstants.spacing / 2),
                Text(
                  '11:45 am, 11 January 22',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppConstants.neutral_400,
                      ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
