import 'package:flutter/material.dart';
import 'package:presence/common/app_constants.dart';

class TitleGroup extends StatelessWidget {
  final String title;
  final String subTitle;

  const TitleGroup({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: AppConstants.black,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppConstants.spacing * 2),
        Text(
          subTitle,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppConstants.neutral_500,
              ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
