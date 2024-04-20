import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe01/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: ProfilePage(),
    );
  }
}
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body :Column(
        children: [
            Row(
              children: [

                SizedBox(
                  width: 100,
                  height: 100,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/avatar.png"),
                  ),
                )
              ],
            )

        ],
      )
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: Icon(Icons.arrow_back_ios_new_rounded),
      title: const Text('Profile'),
      centerTitle: true,
      elevation: 1.0,
    );
  }
}
