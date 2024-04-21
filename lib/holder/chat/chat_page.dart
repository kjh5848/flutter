import 'package:flutter/material.dart';
import 'package:flutter_recipe01/components/chat_card.dart';

import '../../model/chat.dart';


class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(" 채팅"),

      ),
      body: ListView.builder(itemCount: chats.length,
      itemBuilder: (context, index) => ChatCard(chat: chats[index]))
    );
  }
}