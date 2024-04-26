import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/data/dtos/response_dto.dart';
import 'package:flutter_blog/data/reporitoreis/user_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dtos/user_request.dart';
import '../models/user.dart';

class SessionUser {
  User? user;
  String? accessToken;
  bool isLogin = false;

  SessionUser();
}

class SessionStore extends SessionUser {
  final mContext = navigatorKey.currentContext;

  Future<void> join(JoinReqDTO joinReqDTO) async {
    ResponseDTO responseDTO = await UserRepository().fetchJoin(joinReqDTO);

    if (responseDTO.success) {
      Navigator.pushNamed(mContext!, Move.loginPage);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("로그인 실패 : ${responseDTO.errorMessage}")),
      );
    }
  }

  Future<void> login(LoginReqDTO loginReqDTO) async {
    var (responseDTO, accessToken) =
        await UserRepository().fetchLogin(loginReqDTO);

    if (responseDTO.success) {
      await secureStorage.write(key: "accessToken", value: accessToken);

      this.user = responseDTO.response;
      this.accessToken = accessToken;
      this.isLogin = true;

      Navigator.pushNamed(mContext!, Move.postListPage);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("로그인 실패 : ${responseDTO.errorMessage}")),
      );
    }
  }
}

final sessionProvider = StateProvider<SessionStore>((ref) {
  return SessionStore();
});
