import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      body: Column(
        children: [
          SizedBox(height: 20),
          ProfileHeader(),
          SizedBox(height: 20),
          // ProfileCountInfo(),
          SizedBox(height: 20),
          // ProfileButtons(),
          ProfileTab()
        ],
      ),
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

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Container(
                width: 400,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: const Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: buildTabBar()),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                  width: 400,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset:
                        const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: buildTabBarView()),
            )
          ],
        ),
      ),
    );
  }

  TabBarView buildTabBarView() {
    return TabBarView(
      children: [
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 2,
            crossAxisCount: 1,
            mainAxisSpacing: 2,
          ),
          itemCount: 42,
          itemBuilder: (context, index) {
            return Image.network(
                "https://picsum.photos/id/${index + 1}/400/400");
          },
        ),
        Container(color: Colors.red),
        Container(color: Colors.blue),
      ],
    );
  }

  TabBar buildTabBar() {
    return TabBar(
      tabs: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.directions_car,
          ),
        ),
        Container(width: 1, height: 16, color: Colors.blue),
        Icon(
          Icons.directions_car,
        ),
        Container(width: 1, height: 16, color: Colors.blue),
        Icon(
          Icons.directions_car,
        ),
      ],
    );
  }
}

class ProfileButtons extends StatelessWidget {
  const ProfileButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [_buildFollowButton(), _buildMessageButton()],
    );
  }

  Widget _buildMessageButton() {
    return InkWell(
      onTap: () {
        print("Message 쿨릭");
      },
      child: Container(
        alignment: Alignment.center,
        width: 150,
        height: 45,
        child: Text("Message", style: TextStyle(color: Colors.black)),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all()),
      ),
    );
  }

  Widget _buildFollowButton() {
    return InkWell(
      onTap: () {
        print("Follow 쿨릭");
      },
      child: Container(
        alignment: Alignment.center,
        width: 150,
        height: 45,
        child: Text(
          "Follow",
          style: TextStyle(color: Colors.white),
        ),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class ProfileCountInfo extends StatelessWidget {
  const ProfileCountInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[400],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildInfo("50", Icons.shopping_bag_outlined),
              Container(width: 2, height: 60, color: Colors.blue),
              _buildInfo("10", Icons.price_change),
              Container(width: 2, height: 60, color: Colors.blue),
              _buildInfo("3", Icons.question_answer_outlined),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfo(String count, IconData icon) {
    return InkWell(
      onTap: () {
        print("${count} 쿨릭");
      },
      child: Container(
        alignment: Alignment.center,
        width: 50,
        height: 45,
        child: Icon(icon),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all()),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [buildHeaderAvatar(), buildheaderProfile()],
    );
  }

  Widget buildHeaderAvatar() {
    return Row(
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/avatar.png"),
          ),
        )
      ],
    );
  }

  Widget buildheaderProfile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("GetinThere",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
        Text("프로그래머/작가/강사", style: TextStyle(fontSize: 20)),
        Text("데어 프로그래밍", style: TextStyle(fontSize: 15)),
      ],
    );
  }
}
