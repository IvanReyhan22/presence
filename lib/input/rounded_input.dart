import 'package:flutter/material.dart';
import 'package:presence/service/global_data.dart';
import 'package:presence/text/paragraph.dart';

class RoundedInput extends StatelessWidget {
  final String? hintText, type, label, error;
  final int? maxLines;
  final IconData? icon;
  final Color color;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  const RoundedInput(
      {Key? key,
      this.hintText,
      required this.color,
      required this.onChanged,
      required this.controller,
      this.icon,
      this.type,
      this.label,
      this.error,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: label != null,
          child: Padding(
            padding: const EdgeInsets.only(bottom: GlobalData.spacing),
            child: Paragraph(
                title: label ?? '', size: 3, color: GlobalData.neutral_500),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: GlobalData.spacing * 2,
          ),
          decoration: BoxDecoration(
            color: GlobalData.white,
            borderRadius: BorderRadius.circular(GlobalData.defaultRadius),
          ),
          child: TextField(
            maxLines: maxLines ?? 1,
            obscureText: type == 'password' ? true : false,
            controller: controller,
            onChanged: onChanged,
            decoration: InputDecoration(
              suffixIcon: Icon(icon, color: GlobalData.neutral_500),
              hintText: hintText,
              hintStyle: const TextStyle(color: GlobalData.neutral_500),
              border: InputBorder.none,
            ),
          ),
        ),
        Visibility(
          visible: error != null,
          child: Padding(
            padding: const EdgeInsets.only(top: GlobalData.spacing),
            child: Paragraph(
                title: error ?? '', size: 3, color: GlobalData.secondary_400),
          ),
        ),
      ],
    );
  }
}
