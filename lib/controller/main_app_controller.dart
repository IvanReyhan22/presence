import 'package:get/get.dart';
import 'package:presence/page/main/home_page.dart';
import 'package:presence/page/main/notification_page.dart';
import 'package:presence/page/main/profile_page.dart';
import 'package:presence/page/main/record_page.dart';

class MainAppController extends GetxController {
  RxInt currentPageIndex = 0.obs;
  final pages = [
    HomePage(),
    const RecordPage(),
    const NotificationPage(),
    const ProfilePage()
  ];

  void setPageIndex(int index) {
    currentPageIndex.value = index;
  }
}
