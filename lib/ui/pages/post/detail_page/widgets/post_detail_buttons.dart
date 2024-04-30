import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/data/models/user.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:flutter_blog/ui/pages/post/update_page/post_update_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostDetailButtons extends ConsumerWidget {
  User user;
  SessionStore sessionStore;

  PostDetailButtons({required this.user, required this.sessionStore});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Visibility(
      visible: user.id == sessionStore.user?.id,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () async {
              // 삭제 로직
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
