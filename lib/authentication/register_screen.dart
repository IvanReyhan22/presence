import 'package:flutter/material.dart';
import 'package:presence/authentication/login_screen.dart';
import 'package:presence/authentication/register_company.dart';
import 'package:presence/button/main_button.dart';
import 'package:presence/button/rounded_image_button.dart';
import 'package:presence/input/rounded_input.dart';
import 'package:presence/service/custom_icons_icons.dart';
import 'package:presence/service/global_data.dart';
import 'package:get/get.dart';
import 'package:presence/text/paragraph.dart';
import 'package:presence/text/separator_text.dart';
import 'package:presence/text/title_group.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                // Heading
                TitleGroup(title: 'greet'.tr, subTitle: 'welcome_cap'.tr),
                const SizedBox(
                  height: GlobalData.spacing * 5,
                ),
                // inputs
                Wrap(
                  runSpacing: GlobalData.spacing * 2,
                  children: [
                    RoundedInput(
                      hintText: 'email',
                      color: GlobalData.neutral_500,
                      onChanged: (val) {},
                      controller: _controller,
                    ),
                    RoundedInput(
                      hintText: 'company id',
                      icon: CustomIcons.office,
                      color: GlobalData.neutral_500,
                      onChanged: (val) {},
                      controller: _controller,
                    ),
                    RoundedInput(
                      hintText: 'username',
                      color: GlobalData.neutral_500,
                      onChanged: (val) {},
                      controller: _controller,
                    ),
                    RoundedInput(
                      hintText: 'password',
                      icon: CustomIcons.eyeoff,
                      color: GlobalData.neutral_500,
                      onChanged: (val) {},
                      controller: _controller,
                    ),
                  ],
                ),
                const SizedBox(
                  height: GlobalData.spacing * 2,
                ),
                // Sign in Button
                MainButton(
                  title: 'sign_up'.tr,
                  type: 'primary',
                  onPressed: (int val) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const RegisterCompany();
                    }));
                  },
                ),
                const SizedBox(
                  height: GlobalData.spacing * 5,
                ),
                Column(
                  children: [
                    SeparatorText(title: 'sign_up_with'.tr),
                    const SizedBox(height: GlobalData.spacing * 2),
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
                    const SizedBox(height: GlobalData.spacing * 2),
                    // Sing
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Paragraph(
                            title: 'member'.tr,
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
                              return const LoginScreen();
                            }));
                          },
                          child: Paragraph(
                            title: 'sign_in'.tr,
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
