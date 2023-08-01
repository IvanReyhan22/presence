import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presence/widgets/button/main_button.dart';
import 'package:presence/common/app_constants.dart';

class BasicModal {
  static void alertDialog(context, String title, String content, String no,
      String ok, Function() okPressed) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppConstants.background,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppConstants.defaultRadius),
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppConstants.neutral_900,
                fontWeight: FontWeight.w600,
              ),
        ),
        content: Text(
          content,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: AppConstants.neutral_900),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              left: AppConstants.spacing * 2,
              right: AppConstants.spacing * 2,
              bottom: AppConstants.spacing * 2,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: MainButton(
                    title: 'Cancel',
                    type: 'secondary',
                    onPressed: () => Get.back(),
                    isLoading: false,
                  ),
                ),
                const SizedBox(width: (AppConstants.spacing * 2) + 4),
                Expanded(
                  child: MainButton(
                    title: 'Sign Out',
                    type: 'primary',
                    onPressed: () => okPressed(),
                    isLoading: false,
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
