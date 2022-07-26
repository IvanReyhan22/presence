import 'package:flutter/material.dart';
import 'package:presence/service/global_data.dart';
import 'package:presence/text/paragraph.dart';

class RoundedCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String? subTitle;
  final Function(int)? onPressed;

  const RoundedCard(
      {Key? key,
      required this.title,
      required this.icon,
      this.subTitle,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed!(1),
      child: Container(
        padding: const EdgeInsets.all(GlobalData.spacing + 4),
        decoration: BoxDecoration(
          color: GlobalData.white,
          borderRadius: BorderRadius.circular(GlobalData.defaultRadius),
        ),
        child: Row(
          crossAxisAlignment: subTitle != null
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: GlobalData.spacing * 4,
            ),
            const SizedBox(width: GlobalData.spacing * 2),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Paragraph(
                  title: title,
                  size: 2,
                  color: GlobalData.neutral_900,
                  weight: FontWeight.w600,
                ),
                if (subTitle != null) ...[
                  const SizedBox(height: GlobalData.spacing),
                  Paragraph(
                    title: subTitle ?? "",
                    size: 3,
                    color: GlobalData.neutral_500,
                  ),
                ]
              ],
            )
          ],
        ),
      ),
    );
  }
}
