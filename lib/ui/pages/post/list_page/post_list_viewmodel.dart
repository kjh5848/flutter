import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dtos/paging_dto.dart';
import 'package:flutter_blog/data/dtos/post_request.dart';
import 'package:flutter_blog/data/dtos/response_dto.dart';
import 'package:flutter_blog/data/models/post.dart';
import 'package:flutter_blog/data/reporitoreis/post_repository.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

// 창고 데이터
class PostListModel {
  PageDTO page;
  List<Post> posts;

  PostListModel({required this.page, required this.posts});
}

// 창고
class PostListViewModel extends StateNotifier<PostListModel?> {
  final refreshCtrl = RefreshController();
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  PostListViewModel(super.state, this.ref);

// 통신없이 상태 변경
  void deletePost(int postId) {
    PostListModel model = state!;
    List<Post> prevPosts = model.posts;
    PageDTO prevPage = model.page;

    List<Post> newPosts = prevPosts.where((p) => p.id != postId).toList();
    state = PostListModel(posts: newPosts, page: prevPage);
  }

  Future<void> notifyInit(int page, {bool isLoad = false}) async {
    ResponseDTO responseDTO = await PostRepository().fetchPostList(page: page);

    if (responseDTO.success) {
      //페이징된 모델을 들고 온다.
      PostListModel nextModel = responseDTO.response;

      if (page > 0) {
        //페이지 0을 들고온다.
        PostListModel prevModel = state!;
        //새 리스트에 이전 페이지와 페이지들을 들고 온다.
        nextModel.posts = [...prevModel.posts, ...nextModel.posts];

        state = nextModel;
      } else {
        state = nextModel;
      }
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("게시물 보기 실패 : ${responseDTO.errorMessage}")));
    }
    refreshCtrl.refreshCompleted();
    // if (isLoad == false) {
    //   //이벤트 종료시에 리플레쉬 종료(최초로드, 풀다운)
    //   refreshCtrl.refreshCompleted();
    // }
  }

  Future<void> notifyAdd(PostSaveReqDTO reqDTO) async {
    SessionUser sessionUser = ref.read(sessionProvider);
    ResponseDTO responseDTO = await PostRepository().savePost(reqDTO);

    if (responseDTO.success) {
      Post newPost = responseDTO.response;

      List<Post> prevPosts = state!.posts;
      PageDTO pageDTO = state!.page;

      List<Post> newPosts = [newPost, ...prevPosts];

      state = PostListModel(page: pageDTO, posts: newPosts);
      Navigator.pop(mContext!);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("게시물 작성 실패 : ${responseDTO.errorMessage}")),
      );
    }
  }

  // void updatePost(Post post) {
  //   //1. 기존 값 가지고 오기
  //   PostListModel model = state!;
  //
  //   //2. 부분 없데이트
  //   PageDTO pageDTO = state!.page;
  //   List<Post> prevPosts = model.posts;
  //   List<Post> newPosts = prevPosts.map((p) {
  //     if (p.id == post.id) {
  //       return post;
  //     } else {
  //       return p;
  //     }
  //   }).toList();
  //
  //   // 3. 기존값을 통째로 변경
  //   state = PostListModel(page: pageDTO, posts: newPosts);
  // }

  Future<void> updatePost(Post post) async {
    // 1. 기존 값 가지고 오기
    PostListModel model = state!;

    // 2. 부분 업데이트
    PageDTO prevPage = model.page;
    List<Post> prevPosts = model.posts;

    // 자바 ()->{}, 자바스크립트 ()=>{}, 다트 (){}
    List<Post> newPosts = prevPosts.map((p) {
      if (p.id == post.id) {
        return post;
      } else {
        return p;
      }
    }).toList();

    await Future.delayed(
        Duration(
          seconds: 5,
        ),
        () => {});
    state = PostListModel(page: prevPage, posts: newPosts);
    // 통신코드
  }
}

// 창고 관리자
final postListProvider =
    StateNotifierProvider<PostListViewModel, PostListModel?>((ref) {
  return PostListViewModel(null, ref)..notifyInit(0);
});
