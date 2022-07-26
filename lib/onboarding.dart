import 'package:flutter/material.dart';
import 'package:presence/authentication/login_screen.dart';
import 'package:presence/authentication/register_screen.dart';
import 'package:presence/button/main_button.dart';
import 'package:presence/service/global_data.dart';
import 'package:get/get.dart';
import 'package:presence/text/title_group.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalData.background,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: GlobalData.spacing * 5,
              horizontal: GlobalData.spacing * 3,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: GlobalData.spacing * 5),
                  child: Image.asset(
                      'assets/images/ilustration_girl_with_media.png'),
                ),
                TitleGroup(
                  title: 'onboard_greet'.tr,
                  subTitle: 'onboard_caption'.tr,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: MainButton(
                        title: 'sign_up'.tr,
                        type: 'secondary',
                        onPressed: (int val) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const RegisterScreen();
                          }));
                        },
                      ),
                    ),
                    const SizedBox(width: (GlobalData.spacing * 2) + 4),
                    Expanded(
                      child: MainButton(
                        title: 'sign_in'.tr,
                        type: 'primary',
                        onPressed: (int val) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const LoginScreen();
                          }));
                        },
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
