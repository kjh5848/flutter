import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/post_detail_viewmodel.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/widgets/post_detail_buttons.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/widgets/post_detail_content.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/widgets/post_detail_profile.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/widgets/post_detail_title.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostDetailBody extends ConsumerWidget {
  int postId;
  PostDetailBody({required this.postId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch -> 창고관리자, 창고, 창고데이터(null) -> ing (통신이 진행중)

    // 매개변수가 다르면, 여러개 만들어지고, 기본적으로는 싱글톤으로 관리된다.
    PostDetailModel? model = ref.watch(postDetailProvider(postId));
    SessionStore sessionStore = ref.watch(sessionProvider);

    if (model == null) {
      return CircularProgressIndicator();
    } else {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            PostDetailTitle("${model.post.title}"),
            const SizedBox(height: largeGap),
            PostDetailProfile(user: model.post.user),
            PostDetailButtons(
              user: model.post.user,
              sessionStore: sessionStore!,
            ),
            const Divider(),
            const SizedBox(height: largeGap),
            PostDetailContent("${model.post.content}"),
          ],
        ),
      );
    }
  }
}
