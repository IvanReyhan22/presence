import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:presence/data/api/authentication_service.dart';
import 'package:presence/utils/app_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageController extends GetxController {
  AuthenticationService authService = AuthenticationService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxString loginErr = ''.obs;
  final _resultState = ResultState.idle.obs;

  ResultState get state => _resultState.value;

  Future<dynamic> login() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var _email = emailController.text;
      var _password = passwordController.text;
      loginErr.value = '';
      _resultState.value = ResultState.loading;

      validateForm(_email, _password);
      final response = await authService.loginRequest(_email, _password);
      if (response.status == 200) {
        _resultState.value = ResultState.hasData;
        prefs.setString('token', response.data!.token);
        prefs.setString('user_data', json.encode(response.data!.user));
        Get.offAllNamed('/main_app');
      } else {
        _resultState.value = ResultState.erorr;
        loginErr.value = response.msg;
      }
    } catch (e) {
      _resultState.value = ResultState.erorr;
    }
  }

  validateForm(String email, String password) {
    if (email.isEmpty) {
      loginErr.value = "Email field is empty";
      _resultState.value = ResultState.erorr;
      return;
    }

    if (password.isEmpty) {
      loginErr.value = "Password field is empty";
      _resultState.value = ResultState.erorr;
      return;
    }

    if (!email.contains("@") && !email.contains(".")) {
      loginErr.value = "Please provide a valid email address";
      _resultState.value = ResultState.erorr;
      return;
    }
  }
}
