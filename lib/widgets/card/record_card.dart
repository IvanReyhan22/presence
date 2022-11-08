import 'package:flutter/material.dart';
import 'package:presence/common/custom_icons_icons.dart';
import 'package:presence/common/app_constants.dart';

class RecordCard extends StatefulWidget {
  final int type;
  const RecordCard({Key? key, required this.type}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RecordCardState();
}

class _RecordCardState extends State<RecordCard> {
  bool _isExpanded = false;

  setColor(type) {
    if (type == 0) {
      return AppConstants.neutral_900;
    } else if (type == 1) {
      return AppConstants.secondary_400;
    } else {
      return AppConstants.warning_400;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                '11:45 PM',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: setColor(widget.type),
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Text(
                '12:00 PM',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppConstants.neutral_500,
                    ),
              ),
            ],
          ),
          const SizedBox(width: AppConstants.spacing * 2),
          Container(
            width: AppConstants.spacing * 6,
            height: AppConstants.spacing * 6,
            decoration: const BoxDecoration(
              color: AppConstants.purple_400,
              borderRadius: BorderRadius.all(
                Radius.circular(AppConstants.defaultRadius),
              ),
            ),
            child: Center(
              child: Text(
                '1',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: AppConstants.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          const SizedBox(width: AppConstants.spacing * 2),
          Expanded(
            child: AnimatedSize(
              alignment: Alignment.topLeft,
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'On Time',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: setColor(widget.type),
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: AppConstants.spacing),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        CustomIcons.location,
                        size: AppConstants.spacing * 2,
                      ),
                      const SizedBox(
                        width: AppConstants.spacing,
                      ),
                      Flexible(
                        child: Text(
                          'Main Office - Jln Rose no 20 Malang',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: AppConstants.neutral_500,
                                  ),
                        ),
                      )
                    ],
                  ),
                  if (_isExpanded) ...[
                    const SizedBox(height: AppConstants.spacing),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(CustomIcons.clock,
                            size: AppConstants.spacing * 2),
                        const SizedBox(
                          width: AppConstants.spacing,
                        ),
                        Flexible(
                          child: Text(
                            'Night Shift, 12:00 PM - 08:00 AM',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: AppConstants.neutral_500,
                                    ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: AppConstants.spacing),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(CustomIcons.flag,
                            size: AppConstants.spacing * 2),
                        const SizedBox(
                          width: AppConstants.spacing,
                        ),
                        Flexible(
                          child: Text(
                            'Night Shift, 12:00 PM - 08:00 AM',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: AppConstants.neutral_500,
                                    ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: AppConstants.spacing),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Hide Details',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: AppConstants.secondary_400,
                            ),
                        textAlign: TextAlign.end,
                      ),
                    )
                  ]
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
