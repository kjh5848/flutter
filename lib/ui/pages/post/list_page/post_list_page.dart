import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/post/list_page/post_list_viewmodel.dart';
import 'package:flutter_blog/ui/pages/post/list_page/wiegets/post_list_body.dart';
import 'package:flutter_blog/ui/widgets/custom_navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostListPage extends ConsumerWidget {
  // TODO:궁금증 2 scaffoldKey
  final scaffoldKey = GlobalKey<ScaffoldState>();
  // TODO:궁금증 3 refreshKey
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  PostListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomNavigation(scaffoldKey),
      appBar: AppBar(
        title: const Text("Blog"),
      ),
      body: RefreshIndicator(
        //화면을 끌어내리면 새로고침 해주는 위젯
        key: refreshKey,
        onRefresh: () async {
          ref.read(postListProvider.notifier).notifyInit(0);
        },
        child: PostListBody(),
      ),
    );
  }
}
