import 'package:flutter/material.dart';
import 'package:presence/widgets/button/main_button.dart';
import 'package:presence/widgets/button/profile_button.dart';
import 'package:presence/widgets/button/rounded_image_button.dart';
import 'package:presence/widgets/input/rounded_input.dart';
import 'package:presence/common/custom_icons_icons.dart';
import 'package:presence/common/app_constants.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppConstants.spacing * 5,
            horizontal: AppConstants.spacing * 3,
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
                      size: AppConstants.spacing * 4,
                    ),
                  ),
                  Text(
                    'Edit Profile',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: AppConstants.spacing * 4)
                ],
              ),
              const SizedBox(height: AppConstants.spacing * 4),
              Stack(
                children: [
                  const ProfileButton(
                    image:
                        'https://i.pinimg.com/564x/06/63/f5/0663f52b4e6775adcd134a27853004b3.jpg',
                    size: (AppConstants.spacing * 12) + 4, // 100
                  ),
                  Positioned(
                    child: RoundedImageButton(
                      onPressed: (val) {},
                      icon: CustomIcons.pen,
                      bgColor: AppConstants.white,
                      color: AppConstants.neutral_900,
                    ),
                    right: -AppConstants.spacing * 2,
                    bottom: -AppConstants.spacing * 2,
                  )
                ],
              ),
              const SizedBox(height: AppConstants.spacing * 4),
              RoundedInput(
                label: 'Username',
                hintText: 'Fortune Cookie',
                color: AppConstants.neutral_500,
                onChanged: (val) {},
                controller: _controller,
              ),
              const SizedBox(height: AppConstants.spacing * 2),
              RoundedInput(
                label: 'Email',
                error: 'require verification',
                hintText: 'fortunecookie@gmail.com',
                color: AppConstants.neutral_500,
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
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const SizedBox(width: (AppConstants.spacing * 2) + 4),
                  Expanded(
                    child: MainButton(
                      title: 'Update',
                      type: 'primary',
                      onPressed: () {
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
