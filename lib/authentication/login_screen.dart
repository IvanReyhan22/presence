import 'package:flutter/material.dart';
import 'package:presence/authentication/forgot_password.dart';
import 'package:presence/authentication/greeting.dart';
import 'package:presence/authentication/register_screen.dart';
import 'package:presence/button/main_button.dart';
import 'package:presence/button/rounded_image_button.dart';
import 'package:presence/input/rounded_input.dart';
import 'package:presence/service/global_data.dart';
import 'package:get/get.dart';
import 'package:presence/text/paragraph.dart';
import 'package:presence/text/separator_text.dart';
import 'package:presence/text/title_group.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TitleGroup(title: 'hello'.tr, subTitle: 'welcome_cap'.tr),
                const SizedBox(
                  height: (GlobalData.spacing * 7) + 4,
                ),
                // inputs
                Wrap(
                  runSpacing: GlobalData.spacing * 2,
                  children: [
                    RoundedInput(
                      hintText: 'username',
                      color: GlobalData.neutral_500,
                      onChanged: (val) {},
                      controller: _controller,
                    ),
                    RoundedInput(
                      hintText: 'Password',
                      type: 'password',
                      icon: Icons.visibility_off_outlined,
                      color: GlobalData.neutral_500,
                      onChanged: (val) {},
                      controller: _controller,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const ForgotPassword();
                          }));
                        },
                        child: Paragraph(
                          title: 'forgot_password'.tr,
                          size: 2,
                          color: GlobalData.neutral_500,
                          weight: FontWeight.w500,
                          alignment: TextAlign.end,
                          style: FontStyle.italic,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: GlobalData.spacing * 5,
                ),
                MainButton(
                  title: 'sign_in'.tr,
                  type: 'primary',
                  onPressed: (int val) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Greeting();
                    }));
                  },
                ),
                const SizedBox(
                  height: (GlobalData.spacing * 7) + 4,
                ),
                Column(
                  children: [
                    SeparatorText(title: 'sign_in_with'.tr),
                    const SizedBox(height: GlobalData.spacing * 5),
                    // Social Media Login
                    Wrap(
                      alignment: WrapAlignment.center,
                      direction: Axis.horizontal,
                      spacing: GlobalData.spacing * 2,
                      children: [
                        RoundedImageButton(
                          onPressed: (val) {},
                          image: 'assets/images/google.png',
                        ),
                        RoundedImageButton(
                          onPressed: (val) {},
                          image: 'assets/images/facebook.png',
                        ),
                        RoundedImageButton(
                          onPressed: (val) {},
                          image: 'assets/images/twitter.png',
                        ),
                      ],
                    ),
                    const SizedBox(height: GlobalData.spacing * 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Paragraph(
                            title: 'guess'.tr,
                            size: 3,
                            color: GlobalData.neutral_900),
                        const Paragraph(
                            title: ', ',
                            size: 3,
                            color: GlobalData.neutral_900),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const RegisterScreen();
                            }));
                          },
                          child: Paragraph(
                            title: 'sign_up'.tr,
                            size: 3,
                            color: GlobalData.purple_400,
                            weight: FontWeight.w600,
                          ),
                        )
                      ],
                    )
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
