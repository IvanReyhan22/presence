import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presence/onboarding.dart';
import 'package:presence/service/local_string.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocalString(),
      locale: const Locale('en', 'US'),
      title: 'Presence',
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: const OnBoarding(),
    );
  }
}
