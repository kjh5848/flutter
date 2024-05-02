import 'package:flutter_blog/data/dtos/post_request.dart';
import 'package:flutter_blog/data/reporitoreis/post_repository.dart';

void main() async {
  await fetchPost_test();
}

Future<void> deletePost_test() async {
  await PostRepository().deletePost(2,
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpbWdVcmwiOiIvaW1hZ2VzLzEuanBnIiwic3ViIjoibWV0YWNvZGluZyIsImlkIjoxLCJleHAiOjE3MTQ3ODQyODAsInVzZXJuYW1lIjoic3NhciJ9.7R-jq88U9fSzAEMhTn9k5vNMmpvU-kiVhdiIeUOnXFKHk-owhdWX_8XFFdJVOII-A7jNKfFXVTGLt58_BqvKxA");
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
