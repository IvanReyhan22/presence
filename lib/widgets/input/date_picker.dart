import 'package:flutter/material.dart';
import 'package:presence/common/app_constants.dart';
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
            padding: const EdgeInsets.only(bottom: AppConstants.spacing),
            child: Text(
              widget.label ?? '',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppConstants.neutral_500),
            ),
          ),
        ),
        InkWell(
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.spacing * 2),
            decoration: BoxDecoration(
              color: AppConstants.white,
              borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
            ),
            child: TextField(
              readOnly: true,
              controller: _textEditingController,
              decoration: InputDecoration(
                suffixIcon: Icon(widget.icon, color: AppConstants.neutral_500),
                hintText: widget.hintText,
                hintStyle: const TextStyle(color: AppConstants.neutral_500),
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
            padding: const EdgeInsets.only(top: AppConstants.spacing),
            child: Text(
              widget.error ?? '',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppConstants.secondary_400),
            ),
          ),
        ),
      ],
    );
  }
}
