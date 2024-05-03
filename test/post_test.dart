import 'package:flutter_blog/data/dtos/post_request.dart';
import 'package:flutter_blog/data/reporitoreis/post_repository.dart';

void main() async {
  await deletePost_test();
}

Future<void> fetchjoin_test() async {
  await PostRepository().fetchPostList(
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpbWdVcmwiOiIvaW1hZ2VzLzEuanBnIiwic3ViIjoibWV0YWNvZGluZyIsImlkIjoxLCJleHAiOjE3MTQ3ODQyODAsInVzZXJuYW1lIjoic3NhciJ9.7R-jq88U9fSzAEMhTn9k5vNMmpvU-kiVhdiIeUOnXFKHk-owhdWX_8XFFdJVOII-A7jNKfFXVTGLt58_BqvKxA");
}

Future<void> updatePost_test() async {
  PostUpdateReqDTO reqDTO =
      PostUpdateReqDTO(title: "title 44", content: "content 44");

  int postId = 1;

  await PostRepository().updatePost(postId, reqDTO,
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpbWdVcmwiOiIvaW1hZ2VzLzEucG5nIiwic3ViIjoibWV0YWNvZGluZyIsImlkIjoxLCJleHAiOjE3MTQ4Njg4NTUsInVzZXJuYW1lIjoic3NhciJ9.Rbe3Nguma0uC0CYy6Gv_QIZcxODTGGHxtuvva87NQykafAIqZSY2TInghOGLtKOmMzbORW-w_Q4EpljCVPpxjQ");
}

Future<void> deletePost_test() async {
  await PostRepository().deletePost(2);
}

Future<void> savePost_test() async {
  PostSaveReqDTO reqDTO =
      PostSaveReqDTO(title: "title 24", content: "content 24");

  await PostRepository().savePost(reqDTO,
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpbWdVcmwiOiIvaW1hZ2VzLzEuanBnIiwic3ViIjoibWV0YWNvZGluZyIsImlkIjoxLCJleHAiOjE3MTQ3ODQyODAsInVzZXJuYW1lIjoic3NhciJ9.7R-jq88U9fSzAEMhTn9k5vNMmpvU-kiVhdiIeUOnXFKHk-owhdWX_8XFFdJVOII-A7jNKfFXVTGLt58_BqvKxA");
}

Future<void> fetchPost_test() async {
  await PostRepository().fetchPost(2,
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpbWdVcmwiOiIvaW1hZ2VzLzEuanBnIiwic3ViIjoibWV0YWNvZGluZyIsImlkIjoxLCJleHAiOjE3MTQ3ODQyODAsInVzZXJuYW1lIjoic3NhciJ9.7R-jq88U9fSzAEMhTn9k5vNMmpvU-kiVhdiIeUOnXFKHk-owhdWX_8XFFdJVOII-A7jNKfFXVTGLt58_BqvKxA");
}

Future<void> fetchPostList_test() async {
  await PostRepository().fetchPostList(
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpbWdVcmwiOiIvaW1hZ2VzLzEuanBnIiwic3ViIjoibWV0YWNvZGluZyIsImlkIjoxLCJleHAiOjE3MTQ3ODQyODAsInVzZXJuYW1lIjoic3NhciJ9.7R-jq88U9fSzAEMhTn9k5vNMmpvU-kiVhdiIeUOnXFKHk-owhdWX_8XFFdJVOII-A7jNKfFXVTGLt58_BqvKxA");
}
