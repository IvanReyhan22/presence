import 'package:get/get.dart';

class GreetingController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _goToMain();
  }

  void _goToMain() async {
    Future.delayed(
        const Duration(seconds: 2), () => Get.offAllNamed('main_app'));
  }
}
