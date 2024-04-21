import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe01/components/profile_card.dart';
import 'package:flutter_recipe01/holder/profile/profile_page.dart';
import 'package:flutter_recipe01/model/user.dart';

import 'chat/chat_page.dart';
import 'chat/chat_room_page.dart';
import 'friend/friend_page.dart';
import 'more/more_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          FriendPage(),
          ChatPage(),
          MoreScreen(),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }



  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Colors.grey[100],
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.blue,
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "1",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_vert),
          label: "1",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: "1",
        ),
      ],
    );
  }
}
