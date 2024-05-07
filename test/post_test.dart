import 'package:flutter_blog/data/dtos/post_request.dart';
import 'package:flutter_blog/data/reporitoreis/post_repository.dart';

void main() async {
  await deletePost_test();
}

Future<void> fetchjoin_test() async {
  await PostRepository().fetchPostList();
}

Future<void> updatePost_test() async {
  PostUpdateReqDTO reqDTO =
      PostUpdateReqDTO(title: "title 44", content: "content 44");

  int postId = 1;
  await PostRepository().updatePost(postId, reqDTO);
}

Future<void> deletePost_test() async {
  await PostRepository().deletePost(2);
}

Future<void> savePost_test() async {
  PostSaveReqDTO reqDTO =
      PostSaveReqDTO(title: "title 24", content: "content 24");

  await PostRepository().savePost(
    reqDTO,
  );
}

Future<void> fetchPost_test() async {
  await PostRepository().fetchPost(
    2,
  );
}

Future<void> fetchPostList_test() async {
  await PostRepository().fetchPostList();
}
