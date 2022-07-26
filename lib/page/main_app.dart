import 'package:flutter/material.dart';
import 'package:presence/page/dashboard.dart';
import 'package:presence/page/notification_page.dart';
import 'package:presence/page/profile_page.dart';
import 'package:presence/page/record_page.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:presence/service/custom_icons_icons.dart';
import 'package:presence/service/global_data.dart';

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int currentPageIndex = 0;
  final pages = [
    const Dashboard(),
    const RecordPage(),
    const NotificationPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPageIndex],
      bottomNavigationBar: Container(
        color: GlobalData.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: GlobalData.spacing * 2,
            horizontal: GlobalData.spacing * 3,
          ),
          child: GNav(
            backgroundColor: GlobalData.white,
            color: GlobalData.neutral_900,
            activeColor: GlobalData.white,
            tabBackgroundColor: GlobalData.purple_400,
            padding: const EdgeInsets.symmetric(
                vertical: GlobalData.spacing + 4,
                horizontal: GlobalData.spacing + 4),
            gap: GlobalData.spacing,
            tabs: [
              GButton(
                icon: CustomIcons.home,
                text: 'home'.tr,
              ),
              GButton(
                icon: CustomIcons.search,
                text: 'record'.tr,
              ),
              GButton(
                icon: CustomIcons.notification,
                text: 'notification'.tr,
              ),
              GButton(
                icon: CustomIcons.profile,
                text: 'profile'.tr,
              ),
            ],
            onTabChange: (index) {
              setState(() {
                currentPageIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
