import 'package:dio/dio.dart';

import '../../_core/constants/http.dart';
import '../../ui/pages/post/list_page/post_list_viewmodel.dart';
import '../dtos/paging_dto.dart';
import '../dtos/response_dto.dart';
import '../models/post.dart';

class PostRepository {
  Future<ResponseDTO> fetchPostList(String accessToken, {int page = 0}) async {
    final response = await dio.get(
      "/api/post",
      queryParameters: {"page": page},
      options: Options(headers: {"Authorization": "${accessToken}"}),
    );

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    if(responseDTO.success){
      List<dynamic> temp = responseDTO.response["posts"];
      List<Post> posts = temp.map((e) => Post.fromJson(e)).toList();
      PageDTO pageDTO = PageDTO.fromJson(responseDTO.response);

      PostListModel postListModel = PostListModel(page: pageDTO,posts: posts);
    }

    return responseDTO;
  }
}
