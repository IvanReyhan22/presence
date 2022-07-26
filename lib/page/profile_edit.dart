import 'package:flutter/material.dart';
import 'package:presence/button/main_button.dart';
import 'package:presence/button/profile_button.dart';
import 'package:presence/button/rounded_image_button.dart';
import 'package:presence/input/rounded_input.dart';
import 'package:presence/service/custom_icons_icons.dart';
import 'package:presence/service/global_data.dart';
import 'package:presence/text/heading.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: GlobalData.spacing * 5,
            horizontal: GlobalData.spacing * 3,
          ),
          child: Column(
            children: [
              // Head
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      CustomIcons.arrowleft,
                      size: GlobalData.spacing * 4,
                    ),
                  ),
                  const Heading(
                    title: 'Edit Profile',
                    size: 4,
                    color: GlobalData.neutral_900,
                    weight: FontWeight.w600,
                  ),
                  const SizedBox(width: GlobalData.spacing * 4)
                ],
              ),
              const SizedBox(height: GlobalData.spacing * 4),
              Stack(
                children: [
                  const ProfileButton(
                    image:
                        'https://i.pinimg.com/564x/06/63/f5/0663f52b4e6775adcd134a27853004b3.jpg',
                    size: (GlobalData.spacing * 12) + 4, // 100
                  ),
                  Positioned(
                    child: RoundedImageButton(
                      onPressed: (val) {},
                      icon: CustomIcons.pen,
                      bgColor: GlobalData.white,
                      color: GlobalData.neutral_900,
                    ),
                    right: -GlobalData.spacing * 2,
                    bottom: -GlobalData.spacing * 2,
                  )
                ],
              ),
              const SizedBox(height: GlobalData.spacing * 4),
              RoundedInput(
                label: 'Username',
                hintText: 'Fortune Cookie',
                color: GlobalData.neutral_500,
                onChanged: (val) {},
                controller: _controller,
              ),
              const SizedBox(height: GlobalData.spacing * 2),
              RoundedInput(
                label: 'Email',
                error: 'require verification',
                hintText: 'fortunecookie@gmail.com',
                color: GlobalData.neutral_500,
                onChanged: (val) {},
                controller: _controller,
              ),
              const Expanded(child: SizedBox()),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: MainButton(
                      title: 'Cancel',
                      type: 'secondary',
                      onPressed: (int val) {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const SizedBox(width: (GlobalData.spacing * 2) + 4),
                  Expanded(
                    child: MainButton(
                      title: 'Update',
                      type: 'primary',
                      onPressed: (int val) {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
