import 'package:flutter/material.dart';
import 'package:presence/button/rounded_image_button.dart';
import 'package:presence/service/custom_icons_icons.dart';
import 'package:presence/service/global_data.dart';
import 'package:presence/text/heading.dart';
import 'package:presence/text/paragraph.dart';

class AbsenceCard extends StatefulWidget {
  final String title, desc, date, type;
  final Function(int) onPressed;

  const AbsenceCard(
      {Key? key,
      required this.title,
      required this.desc,
      required this.date,
      required this.type,
      required this.onPressed})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _AbsenceCardState();
}

class _AbsenceCardState extends State<AbsenceCard> {
  Color bgColor = GlobalData.white,
      fgColor = GlobalData.purple_400,
      iconColor = GlobalData.white,
      mainTextColor = GlobalData.neutral_900,
      secondaryTextColor = GlobalData.neutral_500;

  @override
  void initState() {
    super.initState();

    setStyle(widget.type);
  }

  setStyle(type) {
    if (type == 'success') {
      setState(() {
        bgColor = GlobalData.success_400;
        fgColor = GlobalData.white;
        iconColor = GlobalData.neutral_900;
        mainTextColor = GlobalData.white;
        secondaryTextColor = GlobalData.white;
      });
    } else if (type == 'alert') {
      setState(() {
        bgColor = GlobalData.secondary_400;
        fgColor = GlobalData.white;
        iconColor = GlobalData.neutral_900;
        mainTextColor = GlobalData.white;
        secondaryTextColor = GlobalData.white;
      });
    } else {
      setState(() {
        bgColor = GlobalData.white;
        fgColor = GlobalData.purple_400;
        iconColor = GlobalData.white;
        mainTextColor = GlobalData.neutral_900;
        secondaryTextColor = GlobalData.neutral_500;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => widget.onPressed(1),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(bgColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(GlobalData.defaultRadius),
          ),
        ),
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(
            const EdgeInsets.all(GlobalData.spacing * 2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RoundedImageButton(
            onPressed: (val) {},
            icon: CustomIcons.schedule,
            bgColor: fgColor,
            color: iconColor,
          ),
          const SizedBox(width: GlobalData.spacing * 2),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Heading(
                  title: "It's Holiday",
                  size: 5,
                  color: mainTextColor,
                  weight: FontWeight.w600,
                ),
                const SizedBox(height: GlobalData.spacing),
                Paragraph(
                  title: 'Enjoy your holiday with your family at home',
                  size: 2,
                  alignment: TextAlign.left,
                  color: secondaryTextColor,
                ),
                const SizedBox(height: GlobalData.spacing),
                Paragraph(
                  title: '16 January 2022',
                  size: 3,
                  color: secondaryTextColor,
                  weight: FontWeight.w600,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
