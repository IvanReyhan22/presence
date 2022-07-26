import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:presence/authentication/login_screen.dart';
import 'package:presence/button/main_button.dart';
import 'package:presence/input/rounded_input.dart';
import 'package:presence/service/global_data.dart';
import 'package:presence/text/title_group.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: GlobalData.spacing * 5,
                  ),
                  child:
                      Image.asset('assets/images/ilustration_lock_large.png'),
                ),
                const SizedBox(height: GlobalData.spacing * 7),
                TitleGroup(
                  title: 'forgot_password'.tr,
                  subTitle: 'forgot_password_caption'.tr,
                ),
                const SizedBox(height: GlobalData.spacing * 7),
                Column(
                  children: [
                    RoundedInput(
                      hintText: 'email'.tr,
                      color: GlobalData.neutral_500,
                      onChanged: (val) {},
                      controller: _controller,
                    ),
                    const SizedBox(
                      height: GlobalData.spacing * 5,
                    ),
                    MainButton(
                      title: 'reset'.tr,
                      type: 'primary',
                      onPressed: (int val) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const LoginScreen();
                        }));
                      },
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
