import 'package:flutter/material.dart';

import '../../components/appbar_preferred_size.dart';
import '../../components/chat_container.dart';
import '../../model/chat_message.dart';


class ChattingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('채팅'),
        bottom: appBarBottomLine(),
      ),
      body: ListView(
        children: List.generate(
          chatMessageList.length,
              (index) => ChatContainer(chatMessage: chatMessageList[index]),
        ),
      ),
    );
  }
}
