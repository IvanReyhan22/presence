import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:presence/page/dashboard.dart';
import 'package:presence/page/notification_page.dart';
import 'package:presence/page/profile_page.dart';
import 'package:presence/page/record_page.dart';
import 'package:presence/service/global_data.dart';

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
          return const Dashboard();
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
