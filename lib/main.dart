import 'package:flutter/material.dart';
import 'package:flutter_app_01/post.dart';
import 'package:flutter_app_01/post_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<Post> postFT = PostRepository().findById(2);
    Future<List<Post>> postListFT = PostRepository().findAll();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: PostRepository().findById(3),
                builder: (context, snapshot) {
                  print(11111111111111111);
                  if (snapshot.hasData) {
                    Post post = snapshot.data!;

                    return Center(
                      child: Text(
                        "${post.title}",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: postList.length,
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
                    title: Text("${postList[index].title}"),
                    subtitle: Text("${postList[index].body}"),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
