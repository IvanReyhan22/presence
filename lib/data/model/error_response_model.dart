class ErrorResponse {
  ErrorResponse({
    required this.status,
    this.msg,
    required this.errors,
  });

  final int status;
  final String? msg;
  final String errors;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        status: json["status"],
        msg: json["msg"] ?? "",
        errors: json["errors"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": msg ?? "",
        "errors": errors,
      };
}
