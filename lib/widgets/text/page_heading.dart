import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presence/widgets/button/profile_button.dart';
import 'package:presence/common/custom_icons_icons.dart';
import 'package:presence/common/app_constants.dart';

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
              child: Text(
                "hello,".tr,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: isDark == true
                          ? AppConstants.white
                          : AppConstants.neutral_900,
                    ),
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
                            ? AppConstants.white
                            : AppConstants.neutral_900,
                      ),
                      const SizedBox(width: AppConstants.spacing * 2),
                    ],
                  ),
                ),
                // Page Title
                Text(
                  name,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: isDark == true
                            ? AppConstants.white
                            : type == "name"
                                ? AppConstants.purple_400
                                : AppConstants.neutral_900,
                        fontWeight:
                            type == "name" ? FontWeight.bold : FontWeight.w600,
                      ),
                )
              ],
            ),
          ],
        ),
        if (suffixIcon != null) ...[
          InkWell(
            onTap: () => onSuffixPressed!(1),
            child: Icon(
              suffixIcon ?? CustomIcons.setting,
              color: isDark == true
                  ? AppConstants.white
                  : AppConstants.neutral_900,
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
