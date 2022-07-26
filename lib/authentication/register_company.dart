import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:presence/authentication/greeting.dart';
import 'package:presence/button/main_button.dart';
import 'package:presence/input/rounded_input.dart';
import 'package:presence/service/custom_icons_icons.dart';
import 'package:presence/service/global_data.dart';
import 'package:presence/text/title_group.dart';

class RegisterCompany extends StatefulWidget {
  const RegisterCompany({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegisterCompanyState();
}

class _RegisterCompanyState extends State<RegisterCompany> {
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
                  child: Image.asset(
                      'assets/images/ilustration_man_chatting_with_computer.png'),
                ),
                const SizedBox(height: GlobalData.spacing * 7),
                TitleGroup(
                  title: 'company_register'.tr,
                  subTitle: 'company_register_caption'.tr,
                ),
                const SizedBox(height: GlobalData.spacing * 7),
                Column(
                  children: [
                    RoundedInput(
                      hintText: 'company_id'.tr,
                      color: GlobalData.neutral_500,
                      onChanged: (val) {},
                      controller: _controller,
                      icon: CustomIcons.office,
                    ),
                    const SizedBox(
                      height: GlobalData.spacing * 5,
                    ),
                    MainButton(
                      title: 'sign_up'.tr,
                      type: 'primary',
                      onPressed: (int val) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const Greeting();
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
