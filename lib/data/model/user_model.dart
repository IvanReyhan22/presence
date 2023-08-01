class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.personalId,
    required this.departmentId,
    required this.shiftId,
    required this.role,
    required this.profilePic,
  });

  final String id;
  final String name;
  final String email;
  final String personalId;
  final String departmentId;
  final String shiftId;
  final String role;
  final String profilePic;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        personalId: json["personalId"],
        departmentId: json["departmentId"],
        shiftId: json["shiftId"],
        role: json["role"],
        profilePic: json["profilePic"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "personalId": personalId,
        "departmentId": departmentId,
        "shiftId": shiftId,
        "role": role,
        "profilePic": profilePic,
      };
}
