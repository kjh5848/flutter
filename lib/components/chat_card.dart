import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../holder/chat/chat_room_page.dart';
import '../model/chat.dart';

class ChatCard extends StatelessWidget {
  final Chat chat;

  const ChatCard({
    required this.chat,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatRoomPage(),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(chat.image),
                  ),
                  title: Text(chat.title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  subtitle: Text(chat.content),
                  contentPadding: EdgeInsets.all(0),
                ),
              ),
              Column(
                children: [
                  Text(chat.time,
                      style: const TextStyle(
                          color: Color(0xFFa5a5a5), fontSize: 12)),
                  SizedBox(height: 5),
                  if (chat.count != "0")
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFde6344),
                      ),
                      child: Text(chat.count,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12)),
                    )
                ],
              )
            ],
          ),
        ));
  }
}
