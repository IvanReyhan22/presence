import 'package:flutter/material.dart';
import 'package:presence/common/app_constants.dart';

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
            color: AppConstants.neutral_400,
          ),
        ),
        const SizedBox(width: AppConstants.spacing * 2),
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppConstants.neutral_500,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(width: AppConstants.spacing * 2),
        Expanded(
          child: Container(
            height: 1,
            color: AppConstants.neutral_400,
          ),
        )
      ],
    );
  }
}
