import 'package:flutter/material.dart';
import 'package:presence/service/custom_icons_icons.dart';
import 'package:presence/service/global_data.dart';
import 'package:presence/text/heading.dart';
import 'package:presence/text/paragraph.dart';

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
      return GlobalData.neutral_900;
    } else if (type == 1) {
      return GlobalData.secondary_400;
    } else {
      return GlobalData.warning_400;
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
              Paragraph(
                title: '11:45 PM',
                size: 2,
                color: setColor(widget.type),
                weight: FontWeight.w500,
              ),
              const Paragraph(
                title: '12:00 PM',
                size: 3,
                color: GlobalData.neutral_500,
              )
            ],
          ),
          const SizedBox(width: GlobalData.spacing * 2),
          Container(
            width: GlobalData.spacing * 6,
            height: GlobalData.spacing * 6,
            decoration: const BoxDecoration(
              color: GlobalData.purple_400,
              borderRadius: BorderRadius.all(
                Radius.circular(GlobalData.defaultRadius),
              ),
            ),
            child: const Center(
              child: Heading(
                title: '1',
                size: 3,
                color: GlobalData.white,
                weight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: GlobalData.spacing * 2),
          Expanded(
            child: AnimatedSize(
              alignment: Alignment.topLeft,
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Heading(
                    title: 'On Time',
                    size: 6,
                    color: setColor(widget.type),
                    weight: FontWeight.w600,
                  ),
                  const SizedBox(height: GlobalData.spacing),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(
                        CustomIcons.location,
                        size: GlobalData.spacing * 2,
                      ),
                      SizedBox(
                        width: GlobalData.spacing,
                      ),
                      Flexible(
                        child: Paragraph(
                          title: 'Main Office - Jln Rose no 20 Malang',
                          size: 3,
                          color: GlobalData.neutral_500,
                        ),
                      )
                    ],
                  ),
                  if (_isExpanded) ...[
                    const SizedBox(height: GlobalData.spacing),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(CustomIcons.clock, size: GlobalData.spacing * 2),
                        SizedBox(
                          width: GlobalData.spacing,
                        ),
                        Flexible(
                          child: Paragraph(
                            title: 'Night Shift, 12:00 PM - 08:00 AM',
                            size: 3,
                            color: GlobalData.neutral_500,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: GlobalData.spacing),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(CustomIcons.flag, size: GlobalData.spacing * 2),
                        SizedBox(
                          width: GlobalData.spacing,
                        ),
                        Flexible(
                          child: Paragraph(
                            title: 'No Event',
                            size: 3,
                            color: GlobalData.neutral_500,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: GlobalData.spacing),
                    const SizedBox(
                      width: double.infinity,
                      child: Paragraph(
                        alignment: TextAlign.right,
                        title: 'Hide Details',
                        size: 3,
                        color: GlobalData.secondary_400,
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
