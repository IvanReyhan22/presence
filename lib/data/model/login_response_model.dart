import 'package:presence/data/model/user_model.dart';

class LoginResponse {
  LoginResponse({
    required this.status,
    required this.msg,
    this.data,
  });

  final int status;
  final String msg;
  final Data? data;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        status: json["status"],
        msg: json["msg"],
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data ?? data!.toJson(),
      };
}

class Data {
  Data({
    required this.token,
    required this.user,
  });

  final String token;
  final User user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user.toJson(),
      };
}
