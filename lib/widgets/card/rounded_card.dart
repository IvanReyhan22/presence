import 'package:flutter/material.dart';
import 'package:presence/common/app_constants.dart';

class RoundedCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String? subTitle;
  final Function(int)? onPressed;

  const RoundedCard(
      {Key? key,
      required this.title,
      required this.icon,
      this.subTitle,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed!(1),
      child: Container(
        padding: const EdgeInsets.all(AppConstants.spacing + 4),
        decoration: BoxDecoration(
          color: AppConstants.white,
          borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
        ),
        child: Row(
          crossAxisAlignment: subTitle != null
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: AppConstants.spacing * 4,
            ),
            const SizedBox(width: AppConstants.spacing * 2),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppConstants.neutral_900,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  if (subTitle != null) ...[
                    const SizedBox(height: AppConstants.spacing),
                    Text(
                      subTitle ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: AppConstants.neutral_500,
                          ),
                    ),
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
