class User {
  final int id;
  final String username;
  final String email;
  final String imgUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.imgUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: int.parse(json["id"]),
      username: json["username"],
      email: json["email"] ?? "",
      imgUrl: json["imgUrl"],
      createdAt: DateTime.parse(json["createdAt"]) ?? null,
      updatedAt: DateTime.parse(json["updatedAt"]) ?? null,
    );
  }
//

  // 응답 받은 데이터를 json 처럼 생긴 Map => Dart 오브젝트로 변환하는 함수


}
