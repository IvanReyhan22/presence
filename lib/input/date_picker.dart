import 'package:flutter/material.dart';
import 'package:presence/service/global_data.dart';
import 'package:presence/text/paragraph.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  final String hintText;
  final String? type, label, error;
  final IconData? icon;
  final Color color;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  const DatePicker(
      {Key? key,
      required this.hintText,
      this.type,
      this.label,
      this.error,
      this.icon,
      required this.color,
      this.onChanged,
      this.controller})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget.label != null,
          child: Padding(
            padding: const EdgeInsets.only(bottom: GlobalData.spacing),
            child: Paragraph(
                title: widget.label ?? '',
                size: 3,
                color: GlobalData.neutral_500),
          ),
        ),
        InkWell(
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: GlobalData.spacing * 2),
            decoration: BoxDecoration(
              color: GlobalData.white,
              borderRadius: BorderRadius.circular(GlobalData.defaultRadius),
            ),
            child: TextField(
              readOnly: true,
              controller: _textEditingController,
              decoration: InputDecoration(
                suffixIcon: Icon(widget.icon, color: GlobalData.neutral_500),
                hintText: widget.hintText,
                hintStyle: const TextStyle(color: GlobalData.neutral_500),
                border: InputBorder.none,
              ),
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.utc(2022, 1, 1),
                  lastDate: DateTime.utc(2022, 12, 30),
                ).then((selectedDate) {
                  var day = DateFormat.M().format(selectedDate!);
                  var month = DateFormat.LLLL().format(selectedDate);
                  var year = DateFormat.y().format(selectedDate);
                  _textEditingController.text = day.toString() +
                      ' ' +
                      month.toString() +
                      ' ' +
                      year.toString();
                });
              },
            ),
          ),
        ),
        Visibility(
          visible: widget.error != null,
          child: Padding(
            padding: const EdgeInsets.only(top: GlobalData.spacing),
            child: Paragraph(
                title: widget.error ?? '',
                size: 3,
                color: GlobalData.secondary_400),
          ),
        ),
      ],
    );
  }
}
