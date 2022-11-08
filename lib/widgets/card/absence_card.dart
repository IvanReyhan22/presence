import 'package:flutter/material.dart';
import 'package:presence/widgets/button/rounded_image_button.dart';
import 'package:presence/common/custom_icons_icons.dart';
import 'package:presence/common/app_constants.dart';

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
  Color bgColor = AppConstants.white,
      fgColor = AppConstants.purple_400,
      iconColor = AppConstants.white,
      mainTextColor = AppConstants.neutral_900,
      secondaryTextColor = AppConstants.neutral_500;

  @override
  void initState() {
    super.initState();

    setStyle(widget.type);
  }

  setStyle(type) {
    if (type == 'success') {
      setState(() {
        bgColor = AppConstants.success_400;
        fgColor = AppConstants.white;
        iconColor = AppConstants.neutral_900;
        mainTextColor = AppConstants.white;
        secondaryTextColor = AppConstants.white;
      });
    } else if (type == 'alert') {
      setState(() {
        bgColor = AppConstants.secondary_400;
        fgColor = AppConstants.white;
        iconColor = AppConstants.neutral_900;
        mainTextColor = AppConstants.white;
        secondaryTextColor = AppConstants.white;
      });
    } else {
      setState(() {
        bgColor = AppConstants.white;
        fgColor = AppConstants.purple_400;
        iconColor = AppConstants.white;
        mainTextColor = AppConstants.neutral_900;
        secondaryTextColor = AppConstants.neutral_500;
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
            borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
          ),
        ),
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(
            const EdgeInsets.all(AppConstants.spacing * 2)),
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
          const SizedBox(width: AppConstants.spacing * 2),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "It's Holiday",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppConstants.purple_400,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: AppConstants.spacing),
                Text(
                  'Enjoy your holiday with your family at home',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppConstants.neutral_500,
                      ),
                ),
                const SizedBox(height: AppConstants.spacing),
                Text(
                  '16 January 2022',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppConstants.neutral_500,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
