import 'package:flutter/material.dart';
import 'package:flutter_app_01/post.dart';
import 'package:flutter_app_01/post_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostListPage extends StatelessWidget {
  const PostListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PostList(),
      ),
    );
  }
}

class PostList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PostListModel? model = ref.watch(postListProvider);

    if (model == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      List<Post> posts = model.postList;

      return Column(
        children: [
          ElevatedButton(
              onPressed: () {
                ref.read(postListProvider.notifier).notifyDelete();
              },
              child: Text("3번 삭제")),
          Expanded(
            child: ListView.separated(
              itemCount: posts.length,
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey,
                  height: 1,
                  thickness: 1,
                );
              },
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.ac_unit_outlined),
                  title: Text("${posts[index].title}"),
                  subtitle: Text("${posts[index].body}"),
                );
              },
            ),
          ),
        ],
      );
    }
  }
}
