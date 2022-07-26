import 'package:flutter/cupertino.dart';
import 'package:presence/service/global_data.dart';
import 'package:presence/text/heading.dart';
import 'package:presence/text/paragraph.dart';

class TimeCard extends StatelessWidget {
  final IconData icon;
  final String title, type;
  const TimeCard(
      {Key? key, required this.icon, required this.title, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(GlobalData.spacing * 2),
      decoration: BoxDecoration(
        color: GlobalData.white,
        borderRadius: BorderRadius.circular(GlobalData.defaultRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            icon,
            color: GlobalData.neutral_900,
            size: GlobalData.spacing * 3,
          ),
          const SizedBox(height: GlobalData.spacing),
          Heading(
            title: title,
            size: 5,
            color: GlobalData.neutral_900,
            weight: FontWeight.w600,
          ),
          const SizedBox(height: GlobalData.spacing),
          Paragraph(
            title: type,
            size: 3,
            color: GlobalData.neutral_500,
          )
        ],
      ),
    );
  }
}
