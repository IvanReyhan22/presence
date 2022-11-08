import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:presence/common/app_constants.dart';
import 'package:unicons/unicons.dart';

class SummaryCard extends StatelessWidget {
  final String header, contentTitle, date, theme;
  final double? chartVal;
  final String? contentDesc;
  final bool isChart;

  const SummaryCard({
    Key? key,
    required this.theme,
    required this.isChart,
    required this.header,
    required this.contentTitle,
    this.contentDesc,
    this.chartVal,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
            theme == "primary" ? AppConstants.purple_400 : AppConstants.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(AppConstants.defaultRadius),
        ),
      ),
      padding: const EdgeInsets.all(AppConstants.spacing * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                header,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: theme == "primary"
                          ? AppConstants.white
                          : AppConstants.neutral_900,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Icon(
                UniconsLine.angle_right,
                color: theme == "primary"
                    ? AppConstants.white
                    : AppConstants.neutral_900,
              )
            ],
          ),
          const SizedBox(
            height: AppConstants.spacing * 2,
          ),

          // Chart
          Visibility(
            visible: isChart,
            child: SizedBox(
              height: AppConstants.spacing * 16,
              child: CircularPercentIndicator(
                radius: AppConstants.spacing * 8,
                lineWidth: AppConstants.spacing,
                animation: true,
                percent: chartVal ?? 0.0,
                center: Text(
                  contentTitle,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: theme == 'primary'
                            ? AppConstants.white
                            : AppConstants.purple_400,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: AppConstants.purple_200,
                backgroundWidth: AppConstants.spacing / 2,
                progressColor: theme == 'primary'
                    ? AppConstants.white
                    : AppConstants.purple_400,
              ),
            ),
          ),
          Visibility(
            visible: !isChart,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contentTitle,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: theme == 'primary'
                            ? AppConstants.white
                            : AppConstants.purple_400,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  contentDesc ?? 'null',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: theme == 'primary'
                            ? AppConstants.white
                            : AppConstants.neutral_900,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: AppConstants.spacing * 2,
          ),
          Text(
            date,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: theme == 'primary'
                      ? AppConstants.purple_200
                      : AppConstants.neutral_500,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}
