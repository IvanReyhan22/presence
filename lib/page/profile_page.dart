import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:presence/button/profile_button.dart';
import 'package:presence/card/rounded_card.dart';
import 'package:presence/modal/basic_modal.dart';
import 'package:presence/onboarding.dart';
import 'package:presence/page/profile_edit.dart';
import 'package:presence/page/reset_password.dart';
import 'package:presence/service/custom_icons_icons.dart';
import 'package:presence/service/global_data.dart';
import 'package:presence/text/heading.dart';
import 'package:presence/text/page_heading.dart';
import 'package:presence/text/paragraph.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
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
              children: <Widget>[
                PageHeading(
                  greet: false,
                  suffixIcon: CustomIcons.pen,
                  onSuffixPressed: (val) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const ProfileEdit();
                    }));
                  },
                  type: 'heading',
                  name: 'my_profile'.tr,
                  image:
                      'https://i.pinimg.com/564x/06/63/f5/0663f52b4e6775adcd134a27853004b3.jpg',
                ),
                const SizedBox(height: GlobalData.spacing * 4),
                const ProfileButton(
                  image:
                      'https://i.pinimg.com/564x/06/63/f5/0663f52b4e6775adcd134a27853004b3.jpg',
                  size: (GlobalData.spacing * 12) + 4, // 100
                ),
                const SizedBox(height: GlobalData.spacing),
                const Heading(
                  title: 'Fortune Cookie',
                  size: 4,
                  color: GlobalData.neutral_900,
                  weight: FontWeight.w600,
                ),
                const Paragraph(
                  title: 'fortunecookie@gmail.com',
                  size: 1,
                  color: GlobalData.neutral_500,
                ),
                const SizedBox(height: GlobalData.spacing * 4),
                const RoundedCard(
                  title: 'Company Name',
                  subTitle: 'Jln Rose no 20 Malang - 2nd Floor',
                  icon: CustomIcons.workcase,
                ),
                const SizedBox(height: GlobalData.spacing * 2),
                RoundedCard(
                  title: 'Change Password',
                  icon: CustomIcons.lock,
                  onPressed: (val) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const ResetPassword();
                    }));
                  },
                ),
                const SizedBox(height: GlobalData.spacing * 2),
                RoundedCard(
                  title: 'SignOut',
                  icon: CustomIcons.signout,
                  onPressed: (val) => BasicModal.alertDialog(
                    context,
                    'Are you sure?',
                    'You will be sign out from the app and redirected to login screen.',
                    'Cancel',
                    'Sign Out',
                    (val) => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const OnBoarding();
                    })),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
