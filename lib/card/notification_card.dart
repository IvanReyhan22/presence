import 'package:flutter/material.dart';
import 'package:presence/button/rounded_image_button.dart';
import 'package:presence/service/custom_icons_icons.dart';
import 'package:presence/service/global_data.dart';
import 'package:presence/text/paragraph.dart';

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
            bgColor: GlobalData.purple_200,
            color: GlobalData.neutral_900,
          ),
          const SizedBox(
            width: GlobalData.spacing * 2,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Paragraph(
                  title: 'Heads Up, 15 minutes left',
                  size: 1,
                  color: GlobalData.neutral_900,
                  weight: FontWeight.w600,
                ),
                SizedBox(height: GlobalData.spacing / 2),
                Paragraph(
                  title: 'Wakey wakeyyy, your about to be late get going now.',
                  size: 3,
                  color: GlobalData.neutral_500,
                ),
                SizedBox(height: GlobalData.spacing / 2),
                Paragraph(
                  title: '11:45 am, 11 January 22',
                  size: 3,
                  color: GlobalData.neutral_400,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
