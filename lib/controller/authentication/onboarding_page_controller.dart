import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingPageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkIsLogin();
  }

  Future<dynamic> checkIsLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final isTokenExist = prefs.getString('token');
    if (isTokenExist != null) {
      Get.offAllNamed('/main_app');
    }
  }
}
