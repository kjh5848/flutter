import '../models/Post.dart';

class PageDTO {
  bool isFirst;
  bool isLast;
  int pageNumber;
  int size;
  int totalPage;

  //나중에 다른 페이지도 페이징할려면 다이나믹으로 수정해서 쓴다.
  List<Post>? posts;

  PageDTO.fromJson(Map<String, dynamic> json)
      : isFirst = json["isFirst"],
        isLast = json["isLast"],
        pageNumber = json["pageNumber"],
        size = json["size"],
        totalPage = json["totalPage"],
        posts = List<Post>.from(
            (json["posts"] ?? []).map((post) => Post.fromJson(post)));
}
