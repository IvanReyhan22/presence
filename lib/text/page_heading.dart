import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presence/button/profile_button.dart';
import 'package:presence/service/custom_icons_icons.dart';
import 'package:presence/service/global_data.dart';
import 'package:presence/text/heading.dart';

class PageHeading extends StatelessWidget {
  final bool greet;
  final bool? isDark;
  final String type, image, name;
  final IconData? icon;
  final Function(int)? onSuffixPressed;
  final IconData? suffixIcon;

  const PageHeading(
      {Key? key,
      required this.image,
      required this.name,
      required this.greet,
      required this.type,
      this.isDark,
      this.icon,
      this.suffixIcon,
      this.onSuffixPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment:
          type == 'name' ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greet
            Visibility(
              child: Heading(
                title: "hello,".tr,
                size: 5,
                color:
                    isDark == true ? GlobalData.white : GlobalData.neutral_900,
                weight: FontWeight.normal,
                alignment: TextAlign.left,
              ),
              visible: greet,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Icon
                Visibility(
                  visible: icon == null ? false : true,
                  child: Column(
                    children: [
                      Icon(
                        icon ?? CustomIcons.setting,
                        color: isDark == true
                            ? GlobalData.white
                            : GlobalData.neutral_900,
                      ),
                      const SizedBox(width: GlobalData.spacing * 2),
                    ],
                  ),
                ),
                // Page Title
                Heading(
                  title: name,
                  alignment: TextAlign.center,
                  size: type == "name" ? 3 : 4,
                  color: isDark == true
                      ? GlobalData.white
                      : type == "name"
                          ? GlobalData.purple_400
                          : GlobalData.neutral_900,
                  weight: type == "name" ? FontWeight.bold : FontWeight.w600,
                ),
              ],
            ),
          ],
        ),
        if (suffixIcon != null) ...[
          InkWell(
            onTap: () => onSuffixPressed!(1),
            child: Icon(
              suffixIcon ?? CustomIcons.setting,
              color: isDark == true ? GlobalData.white : GlobalData.neutral_900,
            ),
          ),
        ] else ...[
          ProfileButton(
            image: image,
          ),
        ]
      ],
    );
  }
}
