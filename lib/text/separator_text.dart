import 'package:flutter/cupertino.dart';
import 'package:presence/service/global_data.dart';
import 'package:presence/text/paragraph.dart';

class SeparatorText extends StatelessWidget {
  final String title;
  const SeparatorText({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: GlobalData.neutral_400,
          ),
        ),
        const SizedBox(width: GlobalData.spacing * 2),
        Paragraph(
          title: title,
          size: 3,
          color: GlobalData.neutral_500,
          weight: FontWeight.normal,
          alignment: TextAlign.center,
        ),
        const SizedBox(width: GlobalData.spacing * 2),
        Expanded(
          child: Container(
            height: 1,
            color: GlobalData.neutral_400,
          ),
        )
      ],
    );
  }
}
