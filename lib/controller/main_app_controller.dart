import 'package:get/get.dart';
import 'package:presence/page/dashboard.dart';
import 'package:presence/page/notification_page.dart';
import 'package:presence/page/profile_page.dart';
import 'package:presence/page/record_page.dart';

class MainAppController extends GetxController {
  RxInt currentPageIndex = 0.obs;
  final pages = [
    const HomePage(),
    const RecordPage(),
    const NotificationPage(),
    const ProfilePage()
  ];

  void setPageIndex(int index) {
    currentPageIndex.value = index;
  }
}
