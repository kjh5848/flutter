import 'package:flutter_app_01/post.dart';
import 'package:flutter_app_01/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 창고 데이터
class PostListModel {
  List<Post> postList;

  PostListModel(this.postList);
}

// 2. 창고
class PostListVM extends StateNotifier<PostListModel?> {
  PostListVM(super.state);

  void notifyInit() async {
    List<Post> postList = await PostRepository().findAll();
    state = PostListModel(postList);
  }

  void notifyDelete() async {
    String result = await PostRepository().deleteById(3);
    print("result : ${result}");
    if (result == "ok") {
      PostListModel model = state!;
      List<Post> postList = model.postList;

      List<Post> newPostList = postList.where((p) => p.id != 3).toList();

      print("newPostList 크기 : ${newPostList.length}");
      state = PostListModel(newPostList);
    } else {
      print("삭제 실패");
    }
  }
}

// 3. 창고 관리자
final postListProvider =
    StateNotifierProvider<PostListVM, PostListModel?>((ref) {
  PostListVM vm = PostListVM(null);
  vm.notifyInit();
  return vm;
});
