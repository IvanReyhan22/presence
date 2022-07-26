import 'package:flutter/material.dart';
import 'package:presence/button/main_button.dart';
import 'package:presence/input/rounded_input.dart';
import 'package:presence/service/custom_icons_icons.dart';
import 'package:presence/service/global_data.dart';
import 'package:presence/text/heading.dart';
import 'package:presence/text/title_group.dart';

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
                      title: 'Change Password',
                      size: 4,
                      color: GlobalData.neutral_900,
                      weight: FontWeight.w600,
                    ),
                    const SizedBox(width: GlobalData.spacing * 4),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: GlobalData.spacing * 3,
                    horizontal: GlobalData.spacing * 5,
                  ),
                  child: Image.asset('assets/images/ilustration_lock.png'),
                ),
                const TitleGroup(
                  title: 'Carefull',
                  subTitle:
                      'You are about to change your previous password. Save it somewhere save',
                ),
                const SizedBox(height: GlobalData.spacing * 3),
                RoundedInput(
                  label: 'Old Password',
                  hintText: '',
                  color: GlobalData.neutral_500,
                  onChanged: (val) {},
                  controller: _controller,
                ),
                const SizedBox(height: GlobalData.spacing * 2),
                RoundedInput(
                  label: 'New Password',
                  hintText: '',
                  color: GlobalData.neutral_500,
                  onChanged: (val) {},
                  controller: _controller,
                ),
                const SizedBox(height: GlobalData.spacing * 2),
                RoundedInput(
                  label: 'Confirm New Password',
                  hintText: '',
                  color: GlobalData.neutral_500,
                  onChanged: (val) {},
                  controller: _controller,
                ),
                const SizedBox(height: GlobalData.spacing * 3),
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
                        title: 'Save',
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
      ),
    );
  }
}
