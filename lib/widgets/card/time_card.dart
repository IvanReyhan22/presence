import 'package:flutter/material.dart';
import 'package:presence/common/app_constants.dart';

class TimeCard extends StatelessWidget {
  final IconData icon;
  final String title, type;
  const TimeCard(
      {Key? key, required this.icon, required this.title, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.spacing * 2),
      decoration: BoxDecoration(
        color: AppConstants.white,
        borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            icon,
            color: AppConstants.neutral_900,
            size: AppConstants.spacing * 3,
          ),
          const SizedBox(height: AppConstants.spacing),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppConstants.neutral_900,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: AppConstants.spacing),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppConstants.neutral_500,
                ),
          ),
        ],
      ),
    );
  }
}
