import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:presence/widgets/button/profile_button.dart';
import 'package:presence/widgets/card/rounded_card.dart';
import 'package:presence/widgets/modal/basic_modal.dart';
import 'package:presence/page/authentication/onboarding.dart';
import 'package:presence/page/profile_edit_page.dart';
import 'package:presence/page/reset_password.dart';
import 'package:presence/common/custom_icons_icons.dart';
import 'package:presence/common/app_constants.dart';
import 'package:presence/widgets/text/page_heading.dart';

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
              vertical: AppConstants.spacing * 5,
              horizontal: AppConstants.spacing * 3,
            ),
            child: Column(
              children: <Widget>[
                PageHeading(
                  greet: false,
                  suffixIcon: CustomIcons.pen,
                  onSuffixPressed: (val) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const ProfileEditPage();
                    }));
                  },
                  type: 'heading',
                  name: 'my_profile'.tr,
                  image:
                      'https://i.pinimg.com/564x/06/63/f5/0663f52b4e6775adcd134a27853004b3.jpg',
                ),
                const SizedBox(height: AppConstants.spacing * 4),
                const ProfileButton(
                  image:
                      'https://i.pinimg.com/564x/06/63/f5/0663f52b4e6775adcd134a27853004b3.jpg',
                  size: (AppConstants.spacing * 12) + 4, // 100
                ),
                const SizedBox(height: AppConstants.spacing),
                Text(
                  'Fortune Cookie',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text(
                  'fortunecookie@gmail.com',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: AppConstants.neutral_500,
                      ),
                ),
                const SizedBox(height: AppConstants.spacing * 4),
                const RoundedCard(
                  title: 'Company Name',
                  subTitle: 'Jln Rose no 20 Malang - 2nd Floor',
                  icon: CustomIcons.workcase,
                ),
                const SizedBox(height: AppConstants.spacing * 2),
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
                const SizedBox(height: AppConstants.spacing * 2),
                RoundedCard(
                  title: 'SignOut',
                  icon: CustomIcons.signout,
                  onPressed: (val) => BasicModal.alertDialog(
                    context,
                    'Are you sure?',
                    'You will be sign out from the app and redirected to login screen.',
                    'Cancel',
                    'Sign Out',
                    () => Get.offAllNamed('/login'),
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
