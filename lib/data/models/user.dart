import 'package:intl/intl.dart';

class User {
  //API 문서 를 보고 적어야 한다.
  final int id;
  final String username;
  final String email;
  final String imgUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const User({
    required this.id,
    required this.username,
    required this.email,
    required this.imgUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json["id"],
        username: json["username"] ?? "",
        email: json["email"] ?? "",
        imgUrl: json["imgUrl"] ?? "",
        createdAt: json["created"] != null
            ? DateFormat("yyyy-mm-dd").parse(json["createdAt"])
            : null,
        updatedAt: json["updatedAt"] != null
            ? DateFormat("yyyy-mm-dd").parse(json["updatedAt"])
            : null);
  }
//

//
}
