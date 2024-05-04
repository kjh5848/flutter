import 'package:flutter_blog/data/dtos/user_request.dart';
import 'package:logger/logger.dart';

import '../../_core/constants/http.dart';
import '../dtos/response_dto.dart';
import '../models/user.dart';

class UserRepository {
  Future<ResponseDTO> fetchJoin(JoinReqDTO requestDTO) async {
    final response = await dio.post("/join", data: requestDTO.toJson());

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    return responseDTO;
  }

  Future<ResponseDTO> fetchLogin(LoginReqDTO loginReqDTO) async {
    final response = await dio.post("/login", data: loginReqDTO.toJson());
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    Logger().d(response.headers["Authorization"]!.first);

    if (responseDTO.success) {
      responseDTO.response = User.fromJson(responseDTO.response);

      return (responseDTO);
    } else {
      throw new Exception("${responseDTO.errorMessage}");
    }
  }
}
