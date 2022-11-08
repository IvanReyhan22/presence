import 'package:flutter/material.dart';
import 'package:presence/common/app_constants.dart';

class CircularImageButton extends StatelessWidget {
  final IconData icon;
  final double? size;
  final Color? color;

  const CircularImageButton(
      {Key? key, required this.icon, this.size, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppConstants.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.defaultRadius * 5),
          ),
        ),
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(
            const EdgeInsets.all(AppConstants.spacing * 3)),
      ),
      onPressed: () {},
      child: Icon(
        icon,
        size: size,
        color: color ?? AppConstants.neutral_900,
      ),
    );
  }
}
