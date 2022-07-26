import 'package:flutter/cupertino.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:presence/service/global_data.dart';
import 'package:presence/text/heading.dart';
import 'package:presence/text/paragraph.dart';
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
        color: theme == "primary" ? GlobalData.purple_400 : GlobalData.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(GlobalData.defaultRadius),
        ),
      ),
      padding: const EdgeInsets.all(GlobalData.spacing * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Paragraph(
                title: header,
                size: 3,
                color: theme == "primary"
                    ? GlobalData.white
                    : GlobalData.neutral_900,
                weight: FontWeight.w500,
              ),
              Icon(
                UniconsLine.angle_right,
                color: theme == "primary"
                    ? GlobalData.white
                    : GlobalData.neutral_900,
              )
            ],
          ),
          const SizedBox(
            height: GlobalData.spacing * 2,
          ),

          // Chart
          Visibility(
            visible: isChart,
            child: SizedBox(
              height: GlobalData.spacing * 16,
              child: CircularPercentIndicator(
                radius: GlobalData.spacing * 8,
                lineWidth: GlobalData.spacing,
                animation: true,
                percent: chartVal ?? 0.0,
                center: Paragraph(
                  title: contentTitle,
                  size: 2,
                  color: theme == 'primary'
                      ? GlobalData.white
                      : GlobalData.purple_400,
                  weight: FontWeight.w600,
                ),
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: GlobalData.purple_200,
                backgroundWidth: GlobalData.spacing / 2,
                progressColor: theme == 'primary'
                    ? GlobalData.white
                    : GlobalData.purple_400,
              ),
            ),
          ),
          Visibility(
            visible: !isChart,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Heading(
                  title: contentTitle,
                  weight: FontWeight.bold,
                  size: 5,
                  color: theme == 'primary'
                      ? GlobalData.white
                      : GlobalData.purple_400,
                ),
                Paragraph(
                  title: contentDesc ?? 'null',
                  size: 3,
                  weight: FontWeight.w500,
                  color: theme == 'primary'
                      ? GlobalData.white
                      : GlobalData.neutral_900,
                )
              ],
            ),
          ),
          const SizedBox(
            height: GlobalData.spacing * 2,
          ),
          Paragraph(
            title: date,
            size: 3,
            color: theme == 'primary'
                ? GlobalData.purple_200
                : GlobalData.neutral_500,
            weight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
