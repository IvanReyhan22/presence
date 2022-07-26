import 'package:flutter/material.dart';
import 'package:presence/service/global_data.dart';
import 'package:presence/text/paragraph.dart';

// typedef IntCallback = void Function(int val);

class MainButton extends StatelessWidget {
  final String title;
  final String type;
  // final IntCallback onPressed;
  final Function(int) onPressed;

  // int val = 0;

  const MainButton(
      {Key? key,
      required this.title,
      required this.type,
      required this.onPressed})
      : super(key: key);

  setStyle(type) {
    if (type == 'primary') {
      return ButtonStyle(
        minimumSize: MaterialStateProperty.all(
            const Size(double.infinity, GlobalData.spacing * 6)),
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(GlobalData.purple_400),
        padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(vertical: GlobalData.spacing + 4)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(GlobalData.defaultRadius),
          ),
        ),
      );
    } else {
      return ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(GlobalData.white),
        padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(vertical: GlobalData.spacing + 4)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(GlobalData.defaultRadius),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          onPressed(1);
        },
        child: Paragraph(
          title: title,
          size: 2,
          color: type == 'primary' ? GlobalData.white : GlobalData.neutral_900,
          weight: FontWeight.w600,
          alignment: TextAlign.center,
        ),
        style: setStyle(type));
  }
}
