import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dtos/user_request.dart';
import 'package:flutter_blog/data/reporitoreis/user_repository.dart';

void main() async {
  // dio.interceptors.remove(interceptor);
  await fetchLogin_test();
}

Future<void> fetchJoin_test() async {
  JoinReqDTO reqDTO = JoinReqDTO(username: "asda", password: "1234",email: "asd@nate.com");

  await UserRepository().fetchJoin(reqDTO);
}

Future<void> fetchLogin_test() async {
  LoginReqDTO reqDTO = LoginReqDTO(username: "asd", password: "1234");

  await UserRepository().fetchLogin(reqDTO);
}
