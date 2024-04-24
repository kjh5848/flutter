import 'package:flutter_app_01/post.dart';

/**
 * 1. DAO -> 디비 접근
 * 2. Repository -> 디비 or 다른API or 파일
 */

// 가짜 통신
class PostRepository {
  Future<Post> findById(int id) {
    return Future.delayed(Duration(seconds: 3), () => postList[id - 1]);
  }

  Future<List<Post>> findAll() {
    return Future.delayed(Duration(seconds: 3), () => postList);
  }

  Future<String> deleteById(int id) {
    return Future.delayed(Duration(seconds: 3), () => "ok");
  }
}
