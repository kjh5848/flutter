import 'package:flutter_blog/_core/constants/exception_handler.dart';
import 'package:flutter_blog/data/dtos/user_request.dart';

import '../../_core/constants/http.dart';
import '../dtos/response_dto.dart';
import '../models/user.dart';

class UserRepository {
  Future<ResponseDTO> fetchJoin(JoinReqDTO requestDTO) async {
    final response = await dio.post("/join", data: requestDTO.toJson());

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    return responseDTO;
  }

  Future<(ResponseDTO, String)> fetchLogin(LoginReqDTO requestDTO) async {
    final response = await dio.post("/login", data: requestDTO.toJson());

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.success) {
      responseDTO.response = User.fromJson(responseDTO.response);
      final accessToken = response.headers["Authorization"]!.first;
      return (responseDTO, accessToken);
    } else {
      throw new ExceptionHandler();
    }
  }
}
