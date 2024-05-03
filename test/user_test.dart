import 'package:flutter_blog/data/dtos/user_request.dart';
import 'package:flutter_blog/data/reporitoreis/user_repository.dart';

void main() async {
  await fetchjoin_test();
}

Future<void> fetchjoin_test() async {
  LoginReqDTO reqDTO = LoginReqDTO(username: "ssar", password: "1234");

  await UserRepository().fetchLogin(reqDTO);
}
