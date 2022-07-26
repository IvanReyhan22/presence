import 'package:flutter/material.dart';
import 'package:presence/service/global_data.dart';

class ProfileButton extends StatelessWidget {
  final String image;
  final double? size;
  const ProfileButton({Key? key, required this.image, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(GlobalData.defaultRadius),
      child: Image.network(
        image,
        width: size ?? GlobalData.spacing * 6,
        height: size ?? GlobalData.spacing * 6,
      ),
    );
  }
}
