import 'package:flutter/material.dart';
import 'package:presence/widgets/button/main_button.dart';
import 'package:presence/widgets/input/rounded_input.dart';
import 'package:presence/common/custom_icons_icons.dart';
import 'package:presence/common/app_constants.dart';
import 'package:presence/widgets/text/title_group.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                      'Change Password',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: AppConstants.neutral_900,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(width: AppConstants.spacing * 4),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppConstants.spacing * 3,
                    horizontal: AppConstants.spacing * 5,
                  ),
                  child: Image.asset('assets/images/ilustration_lock.png'),
                ),
                const TitleGroup(
                  title: 'Carefull',
                  subTitle:
                      'You are about to change your previous password. Save it somewhere save',
                ),
                const SizedBox(height: AppConstants.spacing * 3),
                RoundedInput(
                  label: 'Old Password',
                  hintText: '',
                  color: AppConstants.neutral_500,
                  onChanged: (val) {},
                  controller: _controller,
                ),
                const SizedBox(height: AppConstants.spacing * 2),
                RoundedInput(
                  label: 'New Password',
                  hintText: '',
                  color: AppConstants.neutral_500,
                  onChanged: (val) {},
                  controller: _controller,
                ),
                const SizedBox(height: AppConstants.spacing * 2),
                RoundedInput(
                  label: 'Confirm New Password',
                  hintText: '',
                  color: AppConstants.neutral_500,
                  onChanged: (val) {},
                  controller: _controller,
                ),
                const SizedBox(height: AppConstants.spacing * 3),
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
                        title: 'Save',
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
      ),
    );
  }
}
