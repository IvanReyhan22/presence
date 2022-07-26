import 'package:flutter/material.dart';
import 'package:presence/button/main_button.dart';
import 'package:presence/service/global_data.dart';
import 'package:presence/text/heading.dart';
import 'package:presence/text/paragraph.dart';

class BasicModal {
  static void alertDialog(context, String title, String content, String no,
      String ok, Function(int) okPressed) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: GlobalData.background,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(GlobalData.defaultRadius),
          ),
        ),
        title: Heading(
          title: title,
          size: 5,
          color: GlobalData.neutral_900,
          weight: FontWeight.w600,
        ),
        content:
            Paragraph(title: content, size: 2, color: GlobalData.neutral_900),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              left: GlobalData.spacing * 2,
              right: GlobalData.spacing * 2,
              bottom: GlobalData.spacing * 2,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: MainButton(
                    title: 'Cancel',
                    type: 'secondary',
                    onPressed: (int val) {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(width: (GlobalData.spacing * 2) + 4),
                Expanded(
                  child: MainButton(
                    title: 'Sign Out',
                    type: 'primary',
                    onPressed: (val) => okPressed(1),
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
