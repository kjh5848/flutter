import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/data/models/user.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/post_detail_viewmodel.dart';
import 'package:flutter_blog/ui/pages/post/update_page/post_update_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostDetailButtons extends ConsumerWidget {
  User user;
  int postId;
  SessionStore sessionStore;

  PostDetailButtons({
    required this.user,
    required this.postId,
    required this.sessionStore,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Visibility(
      visible: user.id == sessionStore.user!.id,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () async {
              // 창고에 삭제 메서드 호출
              ref
                  .read(postDetailProvider(postId).notifier)
                  .notifyDelete(postId);
            },
            icon: const Icon(CupertinoIcons.delete),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => PostUpdatePage()));
            },
            icon: const Icon(CupertinoIcons.pen),
          ),
        ],
      ),
    );
  }
}
