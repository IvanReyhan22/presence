import 'dart:convert';

import 'package:presence/data/model/login_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:presence/utils/app_config.dart';

class AuthenticationService {
  Future<LoginResponse> loginRequest(String _email, String _password) async {
    Map<String, dynamic> payload = {"email": _email, "password": _password};

    final response = await http.post(
      Uri.parse("${AppConfig.baseUrl}/login"),
      headers: <String, String>{
        "Content-Type": "application/x-www-form-urlencoded"
      },
      body: payload,
    );
    if (response.statusCode == 200 ||
        response.statusCode == 409 ||
        response.statusCode == 422) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Server Error');
    }
  }
}
