import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:presence/page/main/home_page.dart';
import 'package:presence/page/main/notification_page.dart';
import 'package:presence/page/main/profile_page.dart';
import 'package:presence/page/main/record_page.dart';
import 'package:presence/common/app_constants.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  void setActivePage(index) {
    // Navigate to page
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomePage();
        }));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const RecordPage();
        }));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const NotificationPage();
        }));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const ProfilePage();
        }));
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppConstants.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppConstants.spacing * 2,
          horizontal: AppConstants.spacing * 3,
        ),
        child: GNav(
          backgroundColor: AppConstants.white,
          color: AppConstants.neutral_900,
          activeColor: AppConstants.white,
          tabBackgroundColor: AppConstants.purple_400,
          padding: const EdgeInsets.symmetric(
              vertical: AppConstants.spacing + 4,
              horizontal: AppConstants.spacing + 4),
          gap: AppConstants.spacing,
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'home'.tr,
            ),
            GButton(
              icon: Icons.device_hub,
              text: 'record'.tr,
            ),
            GButton(
              icon: Icons.notifications,
              text: 'notification'.tr,
            ),
            GButton(
              icon: Icons.settings,
              text: 'profile'.tr,
            ),
          ],
          onTabChange: (index) {
            setActivePage(index);
          },
        ),
      ),
    );
  }
}
