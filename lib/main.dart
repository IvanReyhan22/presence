import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presence/common/app_constants.dart';
import 'package:presence/common/custom_text_theme.dart';
import 'package:presence/page/authentication/greeting.dart';
import 'package:presence/page/authentication/onboarding.dart';
import 'package:presence/common/local_string.dart';
import 'package:presence/page/authentication/forgot_password.dart';
import 'package:presence/page/authentication/login_page.dart';
import 'package:presence/page/authentication/register_company.dart';
import 'package:presence/page/authentication/register_screen.dart';
import 'package:presence/page/main_app.dart';

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
        textTheme: customTextTheme,
        colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: AppConstants.purple_400,
            onPrimary: AppConstants.black,
            secondary: AppConstants.secondary_400),
        scaffoldBackgroundColor: AppConstants.background,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const OnBoarding()),
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/forgot_password', page: () => ForgotPassword()),
        GetPage(name: '/register', page: () => RegisterPage()),
        GetPage(name: '/register_company', page: () => RegisterCompany()),
        GetPage(name: '/greeting', page: () => Greeting()),
        GetPage(name: '/main_app', page: () => const MainApp()),
      ],
    );
  }
}
