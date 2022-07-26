import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:presence/page/main_app.dart';
import 'package:presence/service/global_data.dart';
import 'package:presence/text/title_group.dart';
import 'dart:async';

class Greeting extends StatefulWidget {
  const Greeting({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GreetingState();
}

class _GreetingState extends State<Greeting> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const MainApp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: GlobalData.spacing * 5,
            horizontal: GlobalData.spacing * 3,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: GlobalData.spacing * 5,
                ),
                child:
                    Image.asset('assets/images/ilustration_girl_with_dog.png'),
              ),
              const SizedBox(
                height: (GlobalData.spacing * 7) + 4,
              ),
              TitleGroup(title: 'welcome'.tr, subTitle: 'welcome_cap'.tr),
            ],
          ),
        ),
      ),
    );
  }
}
