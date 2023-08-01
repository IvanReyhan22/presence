import 'dart:convert';

import 'package:get/get.dart';
import 'package:presence/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageController extends GetxController {
  var personalData;

  @override
  void onInit() {
    super.onInit();
    getPersonalData();
  }

  Future<dynamic> getPersonalData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    personalData = jsonDecode(prefs.getString('user_data')!);
    update();
  }
}
