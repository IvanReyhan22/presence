import 'package:flutter/cupertino.dart';
import 'package:presence/service/global_data.dart';
import 'package:presence/text/heading.dart';
import 'package:presence/text/paragraph.dart';

class TitleGroup extends StatefulWidget {
  final String title;
  final String subTitle;

  const TitleGroup({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _TitleGroupState();
}

class _TitleGroupState extends State<TitleGroup> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Heading(
          title: widget.title,
          size: 3,
          color: GlobalData.neutral_900,
          weight: FontWeight.bold,
          alignment: TextAlign.center,
        ),
        const SizedBox(height: GlobalData.spacing * 2),
        Paragraph(
          title: widget.subTitle,
          size: 2,
          color: GlobalData.neutral_500,
          weight: FontWeight.normal,
          alignment: TextAlign.center,
        ),
      ],
    );
  }
}
