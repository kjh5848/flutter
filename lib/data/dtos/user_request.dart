class JoinReqDTO {
  final String username;
  final String password;
  final String email;

  JoinReqDTO({
    required this.username,
    required this.password,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      "username": this.username,
      "password": this.password,
      "email": this.email,
    };
  }
}

class LoginReqDTO {
  final String username;
  final String password;

  const LoginReqDTO({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "username": this.username,
      "password": this.password,
    };
  }
}
