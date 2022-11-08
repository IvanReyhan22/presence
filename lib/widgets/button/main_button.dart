import 'package:flutter/material.dart';
import 'package:presence/common/app_constants.dart';

// typedef IntCallback = void Function(int val);

class MainButton extends StatelessWidget {
  final String title;
  final String type;
  final Function onPressed;

  const MainButton(
      {Key? key,
      required this.title,
      required this.type,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: type.contains('primary')
                ? AppConstants.white
                : AppConstants.neutral_900,
            fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
      ),
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(type.contains('primary')
            ? AppConstants.purple_400
            : AppConstants.white),
        padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(vertical: AppConstants.spacing + 4)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
          ),
        ),
      ),
    );
  }
}
