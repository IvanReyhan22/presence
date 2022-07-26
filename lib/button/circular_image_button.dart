import 'package:flutter/material.dart';
import 'package:presence/service/global_data.dart';

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
        backgroundColor: MaterialStateProperty.all(GlobalData.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(GlobalData.defaultRadius * 5),
          ),
        ),
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(
            const EdgeInsets.all(GlobalData.spacing * 3)),
      ),
      onPressed: () {},
      child: Icon(
        icon,
        size: size,
        color: color ?? GlobalData.neutral_900,
      ),
    );
  }
}
