import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:presence/common/app_constants.dart';

class RoundedInput extends StatelessWidget {
  final String? hintText, type, label, error;
  final int? maxLines;
  final String? suffixIcon, prefixIcon;
  final Color color;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  const RoundedInput(
      {Key? key,
      this.hintText,
      required this.color,
      required this.onChanged,
      required this.controller,
      this.type,
      this.label,
      this.error,
      this.maxLines,
      this.suffixIcon,
      this.prefixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: label != null,
          child: Padding(
            padding: const EdgeInsets.only(bottom: AppConstants.spacing),
            child: Text(
              label ?? '',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppConstants.neutral_500,
                  ),
            ),
          ),
        ),
        Container(
          padding:
              const EdgeInsets.symmetric(horizontal: AppConstants.spacing * 2),
          decoration: BoxDecoration(
            color: AppConstants.white,
            borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
          ),
          child: TextField(
            maxLines: maxLines ?? 1,
            obscureText: type == 'password' ? true : false,
            controller: controller,
            onChanged: onChanged,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppConstants.black, fontWeight: FontWeight.w600),
            decoration: InputDecoration(
              suffixIcon: suffixIcon != null
                  ? Iconify(suffixIcon!, color: AppConstants.neutral_600)
                  : null,
              suffixIconConstraints: const BoxConstraints(
                minWidth: AppConstants.spacing * 3,
                maxWidth: AppConstants.spacing * 3,
                minHeight: AppConstants.spacing * 3,
                maxHeight: AppConstants.spacing * 3,
              ),
              prefixIcon: prefixIcon != null
                  ? Iconify(prefixIcon!, color: AppConstants.neutral_600)
                  : null,
              prefixIconConstraints: const BoxConstraints(
                minWidth: AppConstants.spacing * 3,
                maxWidth: AppConstants.spacing * 3,
                minHeight: AppConstants.spacing * 3,
                maxHeight: AppConstants.spacing * 3,
              ),
              hintText: hintText,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppConstants.neutral_500),
              border: InputBorder.none,
            ),
          ),
        ),
        Visibility(
          visible: error != null,
          child: Padding(
            padding: const EdgeInsets.only(top: AppConstants.spacing),
            child: Text(
              error ?? '',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppConstants.secondary_400,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
